import MetaTrader5 as mt5

# connect to MetaTrader 5
if not mt5.initialize(
    login=1433417, server="AMPGlobalUSD-Demo-Demo", password="ns2dsyya"
):
    print("initialize() failed")
    mt5.shutdown()
