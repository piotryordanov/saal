import MetaTrader5 as mt5
import schedule
from datetime import datetime, timedelta
import time
from src.Data import Data
from src.Trader import Trader

# Global VARIABLES
SYMBOL = "EPZ23"


data = Data()
trader = Trader()


# Define the function you want to run
def trade_loop():
    print("New TICK")
    # Fetch the ticks
    data.fetch_ticks()

    # Convert the ticks to 1 min OHLC data
    data.resample_ticks_to_ohlc("1min")

    # Generate signals
    long, short = data.generate_signals()
    print(long)
    print(short)
    if long:
        trader.go_long()
    elif short:
        trader.close_positions()


# Schedule the function to run every minute
schedule.every(1).minutes.do(trade_loop)

# Run the scheduler in a loop
while True:
    schedule.run_pending()
    time.sleep(1)

mt5.shutdown()
