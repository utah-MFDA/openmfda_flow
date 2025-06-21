import os
import platform
import subprocess
from time import sleep

default_image = "bgoenner/openmfda"
default_tag = "devel_0.0.1.5"

file_dir = os.path.dirname(os.path.abspath(__file__))

img_dir = ""
img_flow = f"{img_dir}/flow"
img_tools = f"{img_dir}/tools"
img_src = f"{img_dir}/src"

local_flow = f"{file_dir}/flow"
local_tools = f"{file_dir}/tools"
local_src = f"{file_dir}/src"

pnr_img = "bgoenner/mfda_pnr_cp"


def run_mfdaflow_docker(
    design,
    mfda_platform,
    make_args,
    docker_env_vars=None,
    run_deps=False,
    no_check=False,
):

    # pnr_img = "bgoenner/mfda_pnr:latest"
    dock_img = "bgoenner/openmfda:devel_0.0.1.5"

    make_args_l = make_args.split()

    make_env = f' -e DESIGN={design} -e PLATFORM={mfda_platform}'

    # fmt: off
    ##################
    # docker defs

    dname = "openmfda_docker"
    d_mnt = f"""--mount type=bind,src={local_flow},dst={img_flow} \
    --mount type=bind,src={local_tools},dst={img_tools} \
    --mount type=bind,src={local_src},dst={img_src}"""
    d_wd = img_flow
    d_cmd = "make"
    d_cmd += ' '+' '.join(make_args_l)

    d_cmd += make_env

    if run_deps:
        d_cmd += " -B"
    # fmt: on

    if isinstance(docker_env_vars, str):
        docker_env_vars = [docker_env_vars]

    if docker_env_vars is not None and len(docker_env_vars) > 0:
        d_env_vars = ' '.join([f'-e {d_env}' for d_env in docker_env_vars])
    else:
        d_env_vars = ''

    cmd_full = f'''docker run -t
        {d_mnt}
        --user {os.getuid()}:{os.getuid()}
        --name {dname}
        --rm
        -w {d_wd}
        -e "NEW_VER_FL_SITE=T" {d_env_vars}
        {dock_img} {d_cmd}'''

    if platform.system() == "Windows":
        WSL_prefix = "wsl --exec"
        print("Start OpenMFDA")
        win_d_cmd = f"{WSL_prefix} '{cmd_full}'"
        print(win_d_cmd)
        subprocess.run(win_d_cmd.replace('\n', ' '), shell=True)

    elif platform.system() == "Linux":
        print("Start OpenMFDA")
        print(cmd_full)
        subprocess.run(cmd_full.replace('\n', ' '),
                       shell=True, check=(not no_check))
    else:
        raise Exception(f"Platform {platform.system()} not supported")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument("--all", action="store_true", default=False)
    parser.add_argument("--pnr", action="store_true", default=False)
    parser.add_argument("--render", action="store_true", default=False)
    parser.add_argument("--slice", action="store_true", default=False)
    parser.add_argument("--simulate", action="store_true", default=False)
    parser.add_argument("--clean", action="store_true", default=False)

    parser.add_argument("-B", "--run_deps", action="store_true", default=False)

    parser.add_argument("--make_args", type=str, nargs="+", default=None)

    parser.add_argument("--platform", default="h.r.3.3")

    # required args
    parser.add_argument("--design", required=True)

    make_args = []

    args = parser.parse_args()

    print(args.make_args)

    # fmt:off
    if not args.all and \
            not args.pnr and \
            not args.render and \
            not args.slice and \
            not args.simulate and \
            not args.clean and \
            args.make_args is None:
    # fmt:on

        make_args = ["pnr", "render", "simulate"]

    else:
        if args.all:
            make_args += ["all"]
        if args.pnr:
            make_args += ["pnr"]
        if args.render:
            make_args += ["render"]
        if args.slice:
            make_args += ["slice"]
        if args.simulate:
            make_args += ["simulate"]
        if args.clean:
            make_args += ["clean"]

        if args.make_args is not None:
            make_args += args.make_args

    run_mfdaflow_docker(
        args.design,
        args.platform,
        ' '.join(make_args),  # make into one long string
        args.run_deps
    )
