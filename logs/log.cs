/*
  Author: Natic
*/
using System;
using System.Threading;
using Crypto.Natics_Master;

public static class log 
{
   private Timer _timer = null;
   public static void Main() 
   {

      _timer = new Timer(TimerCallback, null, 0, 2000);
      Console.ReadLine();
   }

   private static void TimerCallback(Object o) 
   {
      Console.WriteLine("In TimerCallback: " + DateTime.Now);
   }
   
   private static void GetHashByA3(string log) 
   {
      Natics_Master NM = new Natics_Master(TimerCallback);
      if(log == 0x41 && _timer != NM.getTime()) {
        Console.WriteLine("Decrypt Successful: Key: " + NM.generateHashKey);
      } else {
      Console.WriteLine("Decrypt Failed: Estimated Time: " + NM.Estimate_timing);
      NM.StartNewDecrypt(true,true,NM.generateHashKey(), NM.SendHashKey());
      }
   }
}
