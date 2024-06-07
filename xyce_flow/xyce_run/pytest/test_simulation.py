

def test_pass_file():
    import subprocess
    import sys

    wd = "pytest/spiceFiles"
    test_file = wd+"/smart_toilet_H2O.cir"

    cmd = ("python3 xyceRun.py --file "+test_file).split(' ')

    subprocess.run(cmd)


def test_pass_list():
    import subprocess
    import sys

    wd = "pytest/spiceFiles"
    test_list = "spiceList"

    cmd = ("python3 xyceRun.py --list "+test_list).split(' ')

    subprocess.run(cmd)

def test_pass_config():
    pass

def test_parse_list():

    import xyceRun

    wd = "pytest/spiceFiles"
    test_list = wd+"/spiceList"

    outFileList = xyceRun.parseFileList(test_list)

    assert outFileList[0] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_H2O.cir"
    assert outFileList[1] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_Sample.cir"
    assert outFileList[2] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_Tag.cir"

def test_parse_files():

    import xyceRun

    wd = "pytest/spiceFiles"
    fileString = "./testing/smart_toilet_test/spiceFiles/smart_toilet_H2O.cir "+\
        "./testing/smart_toilet_test/spiceFiles/smart_toilet_Sample.cir "+\
        "./testing/smart_toilet_test/spiceFiles/smart_toilet_Tag.cir"

    outFileList = xyceRun.parseFiles(str(fileString), None)

    assert outFileList[0] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_H2O.cir"
    assert outFileList[1] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_Sample.cir"
    assert outFileList[2] == "./testing/smart_toilet_test/spiceFiles/smart_toilet_Tag.cir"

def test_parse_files_with_wd():

    import xyceRun

    wd = "pytest/spiceFiles"
    fileString = "smart_toilet_H2O.cir "+\
        "smart_toilet_Sample.cir "+\
        "smart_toilet_Tag.cir"

    outFileList = xyceRun.parseFiles(str(fileString), None, wd)

    assert outFileList[0] == "pytest/spiceFiles/smart_toilet_H2O.cir"
    assert outFileList[1] == "pytest/spiceFiles/smart_toilet_Sample.cir"
    assert outFileList[2] == "pytest/spiceFiles/smart_toilet_Tag.cir"

def test_import_libraries():

    import xyceRun

    config_file = "xyceConfig"

    sim = xyceRun.xyceSimulator(config_file)

    print('\n---------')
    print(sim.xyce_command)

    print(sim.xyce_libraries)

    print(sim.genPluginStr())

