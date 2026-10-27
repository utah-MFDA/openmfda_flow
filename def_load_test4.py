import os
import csv
import argparse
import matplotlib.pyplot as plt
# import def_obj_load
# from render import render_def

def is_outside_core(x, y, core_w, core_h, margin):
    return (
        x < margin or
        y < margin or
        x > core_w - margin or
        y > core_h - margin
    )

def move_component_inside(x, y, sub_x, sub_y, region_w, region_h, margin, comp_type):
    new_x = margin + (x % region_w)
    new_y = margin + (y % region_h)
    new_type = f"{comp_type}_moved_{sub_x}_{sub_y}" if comp_type else "UNKNOWN_moved"
    return new_x, new_y, new_type

def main(def_file, design, output_file):
    # tgt_def_file = os.path.abspath(def_file)
    # # tgt_def_file = os.path.abspath(f"./openroad_flow/results/{design}/base/4_final.def")
    # def_obj = def_obj_load.Design()
    # def_obj = def_obj.import_def(tgt_def_file)["design"][design]
    def_obj = f'flow/results/{design}/base/4_final.def'

    CORE_WIDTH = 2550
    CORE_HEIGHT = 1590
    TOTAL_WIDTH = 20670
    TOTAL_HEIGHT = 15300
    UNIT_CONVERSION = 1000
    MARGIN = 360 * UNIT_CONVERSION

    num_sub_x = TOTAL_WIDTH // CORE_WIDTH
    num_sub_y = TOTAL_HEIGHT // CORE_HEIGHT
    print(f" Total Sub-Areas Created: {num_sub_x * num_sub_y} ({num_sub_x} x {num_sub_y})")

    sub_area_counts = {}
    for comp_name, comp_data in def_obj.components.items():
        if hasattr(comp_data, "pos"):
            x, y = comp_data.pos
            sub_x = x // (CORE_WIDTH * UNIT_CONVERSION)
            sub_y = y // (CORE_HEIGHT * UNIT_CONVERSION)
            sub_area_index = (sub_x, sub_y)
            sub_area_counts[sub_area_index] = sub_area_counts.get(sub_area_index, 0) + 1

    print("\nInitial Component Count Per Sub-Area:")
    for (sub_x, sub_y), count in sorted(sub_area_counts.items()):
        print(f" Sub-Area ({sub_x}, {sub_y}): {count} components")

    sub_area_csv = os.path.abspath(f"./openroad_flow/results/{design}/base/sub_area_component_counts.csv")
    os.makedirs(os.path.dirname(sub_area_csv), exist_ok=True)
    with open(sub_area_csv, "w", newline="") as file:
        writer = csv.writer(file)
        writer.writerow(["Sub-Area X", "Sub-Area Y", "Component Count"])
        for (sub_x, sub_y), count in sub_area_counts.items():
            writer.writerow([sub_x, sub_y, count])
    print(f" Sub-Area Component Count Log saved: {sub_area_csv}")

    moved_components = 0
    original_positions = []
    shifted_positions = []
    movement_log = []
    renamed_components = {}

    for comp_name, comp_data in list(def_obj.components.items()):
        if hasattr(comp_data, "pos"):
            x, y = comp_data.pos
            original_positions.append((x, y))
            comp_type = getattr(comp_data, "component_type", "UNKNOWN")
            sub_x = x // (CORE_WIDTH * UNIT_CONVERSION)
            sub_y = y // (CORE_HEIGHT * UNIT_CONVERSION)

            if is_outside_core(x, y, CORE_WIDTH * UNIT_CONVERSION, CORE_HEIGHT * UNIT_CONVERSION, MARGIN):
                region_w = CORE_WIDTH * UNIT_CONVERSION - 2 * MARGIN
                region_h = CORE_HEIGHT * UNIT_CONVERSION - 2 * MARGIN
                new_x, new_y, new_type = move_component_inside(x, y, sub_x, sub_y, region_w, region_h, MARGIN, comp_type)
                new_comp_name = f"{comp_name}_moved"

                renamed_components[new_comp_name] = def_obj.components.pop(comp_name)
                renamed_components[new_comp_name].name = new_comp_name
                renamed_components[new_comp_name].pos = [new_x, new_y]
                renamed_components[new_comp_name].component_type = new_type

                shifted_positions.append((new_x, new_y))
                moved_components += 1
                movement_log.append([
                    new_comp_name, x, y, new_x, new_y,
                    sub_x, sub_y, comp_type, new_type
                ])

    def_obj.components.update(renamed_components)

    csv_file = os.path.abspath(f"./openroad_flow/results/{design}/base/component_movements.csv")
    os.makedirs(os.path.dirname(csv_file), exist_ok=True)
    with open(csv_file, "w", newline="") as file:
        writer = csv.writer(file)
        writer.writerow([
            "Component Name", "Old X", "Old Y", "New X", "New Y",
            "Sub-Area X", "Sub-Area Y", "Old Type", "New Type"
        ])
        writer.writerows(movement_log)

    print(f" Movement Log saved: {csv_file}")

    updated_def_file = os.path.abspath(f"./openroad_flow/results/{design}/base/updated_final.def")
    def_obj.write_def(output_file)
    # def_obj.write_def(updated_def_file)
    print(f" Updated DEF file saved: {updated_def_file}")
    print(f" Total Components Moved: {moved_components}")
    print(f" Total Initial Components: {len(def_obj.components)}")

    render_def(updated_def_file)

    if movement_log:
        print("\n Moved Component Details:")
        for log in movement_log[:10]:
            print(f"  {log[0]} moved from ({log[1]}, {log[2]}) → ({log[3]}, {log[4]}) in Sub-Area ({log[5]}, {log[6]})")

    plt.figure(figsize=(12, 8))
    if original_positions:
        plt.scatter(*zip(*original_positions), color='red', label="Original Positions", alpha=0.5)
    if shifted_positions:
        plt.scatter(*zip(*shifted_positions), color='blue', label="Shifted Positions", alpha=0.5)
    for i in range(num_sub_x + 1):
        plt.axvline(i * CORE_WIDTH * UNIT_CONVERSION, linestyle='--', color='gray', alpha=0.5)
    for j in range(num_sub_y + 1):
        plt.axhline(j * CORE_HEIGHT * UNIT_CONVERSION, linestyle='--', color='gray', alpha=0.5)

    plt.xlabel("X Position (Units)")
    plt.ylabel("Y Position (Units)")
    plt.title("Component Positioning Before and After Shift")
    plt.grid(True)
    plt.legend()
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Move DEF components safely into printable area.")
    
    parser.add_argument("--design", required=True, help="Design name (e.g., demoClass_copy_20)")
    parser.add_argument("--def_file", required=True)
    parser.add_argument("--out_file", required=True)

    args = parser.parse_args()
    main(
        args.def_file,
        args.design,
        args.out_file
    )
