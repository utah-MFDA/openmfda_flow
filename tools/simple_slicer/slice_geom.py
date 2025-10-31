import os
import trimesh
import PIL


def slice_geometry(
        stl_file,
        export_dir,
        printer_resolution,
        layer_h,
        mkdir=False,
        px_sz=None
):
    if os.path.exists(export_dir) and os.path.isdir(export_dir):
        pass
    else:
        if mkdir:
            os.mkdir(export_dir)
        else:
            raise ValueError(f"Invalid export dir '{export_dir}'")

    if os.path.isfile(stl_file):
        pass
    else:
        raise ValueError(f"Invalid stl file '{stl_file}'")

    mesh = trimesh.load(stl_file)
    mesh_ext = mesh.extents
    print(mesh_ext)
    print(printer_resolution)
    px_sz = (mesh.extents[0]/printer_resolution[0],
             mesh.extents[1]/printer_resolution[1])
    num_layer = int(mesh.extents[2]/layer_h) + 1

    if num_layer == 0:
        raise Exception(f"No geometry to slice, file:{stl_file}")
    layer_c = 0
    for layer_count in range(0, num_layer):
        slice = mesh.section(
            plane_origin=[0, 0, layer_count*layer_h], plane_normal=[0, 0, 1])
        if slice is None:
            continue
        layer_c += 1
        slice_2D, to_3D = slice.to_2D()
        """
            This handles regions that are smaller than the max size geometry
                however this assumes the geometry is centered.
        """
        if (mesh_ext[0] - slice_2D.extents[0] > px_sz[0]) or \
                (mesh_ext[1] - slice_2D.extents[1] > px_sz[1]):
            temp_res = (
                int(slice_2D.extents[0]/px_sz[0]), int(slice_2D.extents[1]/px_sz[1]))
            temp_sl_img = slice_2D.rasterize(resolution=temp_res)
            sl_img = PIL.Image.new('1', printer_resolution, 0)
            sl_loc = (
                int((printer_resolution[0] - temp_res[0])/2),
                int((printer_resolution[1] - temp_res[1])/2)
            )
            sl_img.paste(
                temp_sl_img,
                sl_loc
            )
        else:
            sl_img = slice_2D.rasterize(resolution=printer_resolution)
        # sl_img.save(f"{export_dir}/{layer_count}.png")
    sl_img.save(f"{export_dir}/{layer_count+1}.png")
    print(f"Complete {layer_c} sliced images")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument('--stl', required=True)
    parser.add_argument('--out_dir', required=True)
    parser.add_argument('--resolution', required=True,
                        nargs=2, type=int)
    parser.add_argument('--layer_height', required=True, type=float)

    args = parser.parse_args()

    # print(args.resolution)

    slice_geometry(
        stl_file=args.stl,
        export_dir=args.out_dir,
        printer_resolution=args.resolution,
        layer_h=args.layer_height,
        mkdir=True
    )
