import networkx as nx
import csv
import re


class length_route:

    def __init__(self):
        self.wires = {}

    def import_length_file(self, in_length_file):
        dict_re = r'["\']?{([\w\"\'\:\,\.\; ]*)}["\']?'
        item_re = r'((["\']?\w*["\']?)\s*\:\s*(["\']?\w+["\']?)\s*\,?)'
        reader = csv.DictReader(open(in_length_file, 'r'))
        for row in reader:
            row_len = row['length (mm)']
            row_wire = row['wire']
            # parse len_dict
            row_len_dict_str = re.match(dict_re, row_len)
            #print("matched dict", row_len_dict_str)

            if row_len_dict_str:
                row_len_items = re.findall(item_re, row_len_dict_str[0].replace('\n', ' '))
                if len(row_len_items) == 1:
                    if row_len_items[0][1] == "''" or row_len_items[0][1] == '""':
                        self.wires[row_wire] = float(row_len_items[0][2])
                    else:
                        raise ValueError('')
                elif len(row_len_items) > 1:
                    row_len_items = row_len_items
                    for itm in row_len_items:
                        self.wires[row_wire+'_'+itm[1][1:-1]] = float(itm[2])
                else:
                    ValueError("Empty dictionary")


            else:
                self.wires[row_wire] = row_len

    def get_wires(self, prefix=''):
        if prefix == '':
            return self.wires
        else:
            return {i[0]:i[1] for i in self.wires.items() if re.match(prefix+r'.*', i[0]) is not None}


def testing(in_file):
    lr = length_route()

    lr.import_length_file(in_file)
    print(lr.get_wires())
    print(lr.get_wires('connect5'))


if __name__ ==  "__main__":
    ifile = '../../flow/results/demoPCell/base/demoPCell_length.csv'
    testing(ifile)
