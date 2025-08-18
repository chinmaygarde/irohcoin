// We don't have Ethereum specific assertions in Hardhat 3 yet
import assert from "node:assert/strict";
import { describe, it } from "node:test";

import { network } from "hardhat";

describe("Iroh", async function () {
  const { viem } = await network.connect();
  const publicClient = await viem.getPublicClient();
});
