# SPDX-FileCopyrightText: 2024 ETH Zurich and University of Bologna
#
# SPDX-License-Identifier: Apache-2.0

# Torik is a Snitch cluster variant installed alongside the upstream cluster, so
# which environment variable names the cluster depends on the platform.
if(platform STREQUAL Torik)
    set(SNITCH_CLUSTER_HOME_VAR TORIK_HOME)
else()
    set(SNITCH_CLUSTER_HOME_VAR SNITCH_HOME)
endif()

if(NOT DEFINED ENV{${SNITCH_CLUSTER_HOME_VAR}})
    message(FATAL_ERROR "Environment variable ${SNITCH_CLUSTER_HOME_VAR} not set.")
endif()

set(SNITCH_HOME $ENV{${SNITCH_CLUSTER_HOME_VAR}})
set(SNITCH_RUNTIME_HOME ${SNITCH_HOME}/sw/runtime)

add_compile_definitions(
  DEEPLOY_SNITCH_PLATFORM
)

set(DEEPLOY_ARCH SNITCH)

set(num_threads  ${NUM_CORES})

macro(add_snitch_cluster_vsim_simulation name)
    add_custom_target(vsim_${name}
	WORKING_DIRECTORY ${SNITCH_HOME}/target/sim/build
	DEPENDS ${name}
	COMMAND ${QUESTA} bin/${SNITCH_CLUSTER_SIM_BIN}
	${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${name} || true
	COMMENT "Simulating deeploytest with vsim"
	POST_BUILD
	USES_TERMINAL
	VERBATIM
    )
endmacro()

macro(add_snitch_cluster_vsim_gui_simulation name)
    add_custom_target(vsim.gui_${name}
	WORKING_DIRECTORY ${SNITCH_HOME}/target/sim/build
	DEPENDS ${name}
	COMMAND ${QUESTA} bin/${SNITCH_CLUSTER_SIM_BIN}.gui
	${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${name} || true
	COMMENT "Simulating deeploytest with vsim.gui"
	POST_BUILD
	USES_TERMINAL
	VERBATIM
    )
endmacro()

add_compile_options(
    -ffast-math
    $<$<COMPILE_LANGUAGE:CXX>:-Wno-c++11-narrowing>
)

add_link_options(
    -ffast-math
    -Wl,--gc-sections
)
