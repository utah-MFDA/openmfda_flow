import json
# import pp from pprint
import generator_class


def generate_json(
    tlef_file,
    out_json,
    px=None,
    layer=None,
    lpv=None,
    bottom_layers=None
):

    nb = generator_class.NetBuilder(
        px,
        layer,
        lpv,
        bottom_layers
    )

    nb.import_tlef(tlef_file)

    print("Layers:")
    print(nb.layers_list)
    print("")
    print("Vias:")
    print(nb.vias)

    tlef_dict = {
        "file": "",
        "tech":
            {
                "layers": nb.layers_list,
                "vias": nb.vias
            }
    }


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument('--tlef', required=True)
    parser.add_argument('--out_json', required=True)
    parser.add_argument('--px')
    parser.add_argument('--layer')
    parser.add_argument('--lvp')
    parser.add_argument('--bottom_layers')

    args = parser.parse_args()

    generate_json(
        tlef_file=args.tlef,
        out_json=args.out_json,
        px=args.px,
        layer=args.layer,
        lpv=args.layer,
        bottom_layers=args.bottom_layers
    )
