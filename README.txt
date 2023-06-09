Contents of SCIDDICA

landslide_report.pdf  Final report for Assignment 2

altitude.pal    Palette file for the altitude layer

Landslide.ma    SCIDDICA model.  Modify the initial valuse file line
                in this to create your own test
nothing.val     The default initial values, nothing happens.  Modify
                the energy and debris layers of this (3 and 4) to
                get something to happen

Docs/
        Contains the Journal arcticles describing SCIDDICA

Low test
        A simulation with the landslide starting in the lowest
        parts of the map.
        
        low.bat     - runs the sim
        low_drw.bat - generates the .drw file
        low.ma      - model set up for low test
        low.val     - initial values

Nothing test
        A simulation where nothing happens.  Also generates
        debug and parse files for debuging the .MA file.
        
        nothing.bat     - runs the sim
        nothing_drw.bat - generates the .drw file
        NothingSlide.ma - model set up for low test
        Nothing.val     - initial values

Peaks test
        Two landslides start at the highest peaks, in the
        corners of the map

        peaks.bat     - runs the sim
        peaks_drw.bat - generates the .drw file
        peaks.ma      - model set up for low test
        peaks.val     - initial values

Peaks_high test

        Same as Peaks but with larger initial values.
        
        peaks_high.bat     - runs the sim
        peaks_high_drw.bat - generates the .drw file
        peaks_high.ma      - model set up for low test
        peaks_high.val     - initial values

Two_ways test
        Starts a slide on a peak not at the edge of the map
        
        two_ways.bat     - runs the sim
        two_ways_drw.bat - generates the .drw file
        two_ways.ma      - model set up for low test
        two_ways.val     - initial values