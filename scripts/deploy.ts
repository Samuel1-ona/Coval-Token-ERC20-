import { ethers } from "hardhat";

async function main() {
  const Coval = await ethers.deployContract("Coval");

  await Coval.waitForDeployment();

  console.log(`Coval token deployed to ${Coval.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
