# clk
create_clock -name clk -period 4.0 [get_ports clk_p]
create_generated_clock -name clk_div \
                       -source [get_ports clk_p] \
                       -divide_by 4 \
                       [get_ports DUT.u_clk_div.clk_o]
# clk
set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN AY24} [get_ports clk_p      ]
set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN AY23} [get_ports clk_n      ]
# set reset
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN A13 } [get_ports rstn       ]
# set spi
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AY14} [get_ports spi_sck    ]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AY15} [get_ports spi_ss_n   ]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AW15} [get_ports spi_mosi   ]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN AV15} [get_ports spi_miso   ]
# set other
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports enable_p   ]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports enable_n   ]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[0]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[1]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[2]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[3]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[4]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[5]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[6]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_p[7]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[0]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[1]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[2]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[3]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[4]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[5]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[6]]
# set_property -dict {IOSTANDARD LVDS     PACKAGE_PIN ???} [get_ports sample_n[7]]
