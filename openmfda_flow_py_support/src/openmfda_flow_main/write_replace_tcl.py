from openmfda_flow import openmfda_class


def write_replace(
        loc,
        args
        ):
    proj = openmfda_class.OpenMFDA()
    for a in args.items():
        proj.set_replace_arg(a[0], a[1])
    proj.write_replace_config(loc)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument("--loc", required=True, type=str)
    parser.add_argument("--replace_args", required=True, type=list)

    args = parser.parse_args()

    args_d = {}
    for i_ind, i in enumerate(args.replace_args[::2]):
        args_d[args.replace_args[i_ind*2]] = args.replace_args[i_ind*2+1]

    write_replace(args.loc, args_d)
