# SPDX-FileCopyrightText: 2026 ETH Zurich and University of Bologna
#
# SPDX-License-Identifier: Apache-2.0

from Deeploy.Targets.Snitch.Platform import SnitchClusterEngine, SnitchConstantBuffer, SnitchPlatform, \
    SnitchStructBuffer, SnitchTransientBuffer, SnitchVariableBuffer

# Torik is a Snitch cluster variant carrying the MANTA accelerator. Everything the
# cluster itself provides is inherited from the Snitch target; the accelerator will
# be added as a MantaEngine ahead of the cluster engine, which stays last as the
# catch-all for every operator MANTA does not claim.


class TorikPlatform(SnitchPlatform):

    def __init__(self,
                 engines = [SnitchClusterEngine("SnitchCluster")],
                 variableBuffer = SnitchVariableBuffer,
                 constantBuffer = SnitchConstantBuffer,
                 structBuffer = SnitchStructBuffer,
                 transientBuffer = SnitchTransientBuffer) -> None:
        super().__init__(engines, variableBuffer, constantBuffer, structBuffer, transientBuffer)
