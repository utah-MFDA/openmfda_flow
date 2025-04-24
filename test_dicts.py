# 2 samples
assay = "two_samples"
num_samples = 2
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : 5, 
            "R2" : 100
        }
    }
}

# 3 samples
assay = "three_samples"
num_samples = 3
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(200, 250)
        }
    }
}

# 4 samples
assay = "four_samples"
num_samples = 4
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(200, 250)
        }
    }
}

# 4 samples - version 2
assay = "four_samples"
num_samples = 4
designs = {
    "design1": {
        "input_dict": {
            "R1" : 2, 
            "R2" : 50,
            "R3" : 95,
            "R4" : 212
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 1, 
            "R2" : 50,
            "R3" : 95,
            "R4" : 212
        }
    },
    "design3": {
        "input_dict": {
            "R1" : 20, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100
        }
    },
    "design4": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(100, 250)
        }
    }
}

# 5 samples
assay = "five_samples"
num_samples = 5
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(100, 250),
            "R5" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(200, 250)
        }
    }
}

# 5 samples - version 2
assay = "five_samples"
num_samples = 5
designs = {
    "design1": {
        "input_dict": {
            "R1" : 2, 
            "R2" : 11,
            "R3" : 53,
            "R4" : 94,
            "R5" : 209
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 1, 
            "R2" : 11,
            "R3" : 53,
            "R4" : 94,
            "R5" : 209
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(100, 250),
            "R5" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(200, 250)
        }
    }
}

# 6 samples
assay = "six_samples"
num_samples = 6
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(100, 250),
            "R6" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(200, 250)
        }
    }
}

# 7 samples
assay = "seven_samples"
num_samples = 7
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(100, 250),
            "R6" : random.randint(100, 250),
            "R7" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(200, 250)
        }
    }
}

# 8 samples
assay = "eight_samples"
num_samples = 8
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(25, 100),
            "R6" : random.randint(100, 250),
            "R7" : random.randint(100, 250),
            "R8" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(200, 250),
            "R8" : random.randint(200, 250)
        }
    }
}

# 9 samples
assay = "nine_samples"
num_samples = 9
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(25, 100),
            "R6" : random.randint(100, 250),
            "R7" : random.randint(100, 250),
            "R8" : random.randint(100, 250),
            "R9" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(50, 100),
            "R8" : random.randint(200, 250),
            "R9" : random.randint(200, 250)
        }
    }
}

# 10 samples
assay = "ten_samples"
num_samples = 10
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(25, 100),
            "R6" : random.randint(25, 100),
            "R7" : random.randint(100, 250),
            "R8" : random.randint(100, 250),
            "R9" : random.randint(100, 250),
            "R10" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(50, 100),
            "R8" : random.randint(50, 100),
            "R9" : random.randint(200, 250),
            "R10" : random.randint(200, 250)
        }
    }
}

# 11 samples
assay = "eleven_samples"
num_samples = 11
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100,
            "R11" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100,
            "R11" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(25, 100),
            "R6" : random.randint(25, 100),
            "R7" : random.randint(100, 250),
            "R8" : random.randint(100, 250),
            "R9" : random.randint(100, 250),
            "R10" : random.randint(100, 250),
            "R11" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(50, 100),
            "R8" : random.randint(50, 100),
            "R9" : random.randint(200, 250),
            "R10" : random.randint(200, 250),
            "R11" : random.randint(200, 250)
        }
    }
}

# 12 samples
assay = "twelve_samples"
num_samples = 12
designs = {
    "design1": {
        "input_dict": {
            "R1" : 100, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100,
            "R11" : 100,
            "R12" : 100
        }
    },
    "design2": {
        "input_dict": {
            "R1" : 50, 
            "R2" : 100,
            "R3" : 100,
            "R4" : 100,
            "R5" : 100,
            "R6" : 100,
            "R7" : 100,
            "R8" : 100,
            "R9" : 100,
            "R10" : 100,
            "R11" : 100,
            "R12" : 100
        }
    },
    "design3": {
        "input_dict": {
            "R1" : random.randint(1, 25), 
            "R2" : random.randint(25, 100),
            "R3" : random.randint(25, 100),
            "R4" : random.randint(25, 100),
            "R5" : random.randint(25, 100),
            "R6" : random.randint(25, 100),
            "R7" : random.randint(100, 250),
            "R8" : random.randint(100, 250),
            "R9" : random.randint(100, 250),
            "R10" : random.randint(100, 250),
            "R11" : random.randint(100, 250),
            "R12" : random.randint(100, 250)
        }
    },
    "design4": {
        "input_dict": {
            "R1" : 5, 
            "R2" : random.randint(10, 50),
            "R3" : random.randint(50, 100),
            "R4" : random.randint(50, 100),
            "R5" : random.randint(50, 100),
            "R6" : random.randint(50, 100),
            "R7" : random.randint(50, 100),
            "R8" : random.randint(50, 100),
            "R9" : random.randint(200, 250),
            "R10" : random.randint(200, 250),
            "R11" : random.randint(200, 250),
            "R12" : random.randint(200, 250)
        }
    }
}