# ORIGINAL ROUTING CODE
for i in range(0, len(list)-1):
    if (list[i][0][3][0] == 'M'):
        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                    self.snap_to_grid_and_scale(list[i][0][2], False),
                    (int(list[i][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                    self.snap_to_grid_and_scale(list[i][0][2], False),
                    (int(list[i][0][3][3])-1)*20*layer+bottom_layer]
        connect_matrix = [["z", p1, 2]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
    else:
        if list[i][0][1] == list[i][0][3]:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                        self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                        self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            connect_matrix = [["y", p1, 1]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
        else:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][2], False),
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][4], False),
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            connect_matrix = [["x", p1, 0]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
if (list[-1][0][3][0] == 'M'):
    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                self.snap_to_grid_and_scale(list[-1][0][2], False),
                (int(list[-1][0][0])-1)*20*layer+bottom_layer]
    p1 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                self.snap_to_grid_and_scale(list[-1][0][2], False),
                (int(list[-1][0][3][3])-1)*20*layer+bottom_layer]
    connect_matrix = [["z", p1, 2]]
    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
else:
    if list[-1][0][1] == list[-1][0][3]:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                    self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                    self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        connect_matrix = [["y", p1, 1]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
    else:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][2], False),
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][4], False),
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        connect_matrix = [["x", p1, 0]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
        
# FLATTENING ROUTING CODE
for i in range(0, len(list)-1):
    if (list[i][0][3][0] == 'M') and ('PIN' in list[i][0]):
        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                    self.snap_to_grid_and_scale(list[i][0][2], False),
                    (int(list[i][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                    self.snap_to_grid_and_scale(list[i][0][2], False),
                    (int(list[i][0][3][3])-1)*20*layer+bottom_layer]
        connect_matrix = [["z", p1, 2]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
    elif (list[i][0][3][0] == 'M') and not('PIN' in list[i][0]):
        pass
    elif (list[i][0][3][0] != 'M') and ('PIN' in list[i][0]):
        if list[i][0][1] == list[i][0][3]:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                        self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                        self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            connect_matrix = [["y", p1, 1]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
        else:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][2], False),
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][4], False),
                        (int(list[i][0][0])-1)*20*layer+bottom_layer]
            connect_matrix = [["x", p1, 0]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
    elif (list[i][0][3][0] != 'M') and not('PIN' in list[i][0]):
        if list[i][0][1] == list[i][0][3]:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                        self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                        bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                        self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                        bottom_layer]
            connect_matrix = [["y", p1, 1]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
        else:
            p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][2], False),
                        bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                        self.snap_to_grid_and_scale(list[i][0][4], False),
                        bottom_layer]
            connect_matrix = [["x", p1, 0]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
if (list[-1][0][3][0] == 'M') and ('PIN' in list[-1][0]):
    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                self.snap_to_grid_and_scale(list[-1][0][2], False),
                (int(list[-1][0][0])-1)*20*layer+bottom_layer]
    p1 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                self.snap_to_grid_and_scale(list[-1][0][2], False),
                (int(list[-1][0][3][3])-1)*20*layer+bottom_layer]
    connect_matrix = [["z", p1, 2]]
    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
elif (list[-1][0][3][0] == 'M') and not('PIN' in list[-1][0]):
    pass
elif (list[-1][0][3][0] != 'M') and ('PIN' in list[-1][0]):
    if list[-1][0][1] == list[-1][0][3]:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                    self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                    self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        connect_matrix = [["y", p1, 1]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
    else:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][2], False),
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][4], False),
                    (int(list[-1][0][0])-1)*20*layer+bottom_layer]
        connect_matrix = [["x", p1, 0]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
elif (list[-1][0][3][0] != 'M') and not('PIN' in list[-1][0]):
    if list[-1][0][1] == list[-1][0][3]:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                    self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                    bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                    self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                    bottom_layer]
        connect_matrix = [["y", p1, 1]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
    else:
        p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][2], False),
                    bottom_layer]
        p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                    self.snap_to_grid_and_scale(list[-1][0][4], False),
                    bottom_layer]
        connect_matrix = [["x", p1, 0]]
        routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"