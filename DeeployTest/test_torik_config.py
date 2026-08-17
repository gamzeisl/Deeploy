# SPDX-FileCopyrightText: 2026 ETH Zurich and University of Bologna
#
# SPDX-License-Identifier: Apache-2.0
"""Test configuration for the Torik platform.

Torik is a Snitch cluster variant carrying the MANTA accelerator.
"""

DEFAULT_NUM_CORES = 9

KERNEL_TESTS = [
    "Kernels/FP32/Add/Regular",
]

MODEL_TESTS = []
