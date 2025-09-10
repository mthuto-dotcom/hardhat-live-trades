@echo off
echo Installing dependencies...
call npm install
echo.
echo To compile contracts, run: npx hardhat compile
echo To run tests, run: npx hardhat test
pause
