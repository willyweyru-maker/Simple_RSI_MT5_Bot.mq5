#property strict

input int RSI_Period = 14;
input double RSI_Buy = 30;
input double RSI_Sell = 70;
input double LotSize = 0.1;

int rsiHandle;

int OnInit()
{
   rsiHandle = iRSI(_Symbol, PERIOD_CURRENT, RSI_Period, PRICE_CLOSE);
   return(INIT_SUCCEEDED);
}

void OnTick()
{
   double rsi[];
   if(CopyBuffer(rsiHandle, 0, 0, 1, rsi) <= 0) return;

   if(rsi[0] < RSI_Buy)
      OrderSend(_Symbol, OP_BUY, LotSize, Ask, 10, 0, 0);

   if(rsi[0] > RSI_Sell)
      OrderSend(_Symbol, OP_SELL, LotSize, Bid, 10, 0, 0);
}
