# SPDX-FileCopyrightText: 2024 ETH Zurich and University of Bologna
#
# SPDX-License-Identifier: Apache-2.0

set(SNITCH_CLUSTER_HOME ${SNITCH_HOME})

set(SNITCH_CLUSTER_SIM_BIN snitch_cluster.vsim)

if(DEFINED ENV{BANSHEE_INSTALL_DIR})
  set(BANSHEE_CONFIG ${SNITCH_CLUSTER_HOME}/src/banshee.yaml CACHE INTERNAL "source_list")
endif()