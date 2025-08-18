import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("IrohModule", (m) => {
  const iroh = m.contract("Iroh");
  return { iroh };
});
