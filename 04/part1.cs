using System;
using System.IO;
using System.Collections.Generic;
namespace aoc
{
    public class Guard
    {
        public string id { get; set; }
        public int totalSlept { get; set; }
        public int[] whenSlept;
        private int sleepHour;
        public int mostSlept { get; set; }
        public int mostSleptHour { get; set; }
        public Guard(string id)
        {
            this.id = id;
            sleepHour = 0;
            mostSlept = 0;
            whenSlept = new int[60];
        }

        public void fallAsleep(int time)
        {
            sleepHour = time;
        }
        public void wakeUp(int time)
        {
            totalSlept += (time - sleepHour);
            for(int i=sleepHour;i<time-1;i++)
            {
                whenSlept[i]++;
                if(whenSlept[i] > mostSlept)
                {
                    mostSlept = whenSlept[i];
                    mostSleptHour = i;
                }
            }
        }
    }
    class part1
    {
        static void Main()
        {

            StreamReader reader = new StreamReader("input");
            Dictionary <string, Guard> guards = new Dictionary<string, Guard>();
            Guard activeGuard = null;
            while(reader.Peek() != -1)
            {
                string [] data = reader.ReadLine().Split(' ');
                /*
                * STRING INDEXES:
                * 2: action
                * 3: #ID
                */
                switch(data[2])
                {
                    case "Guard":
                        if(!guards.ContainsKey(data[3]))
                        {
                            guards[data[3]] = new Guard(data[3]);
                        }
                        activeGuard = guards[data[3]];
                        break;
                    case "falls":
                        activeGuard.fallAsleep(Int32.Parse(data[1].Substring(3,2)));
                        break;
                    case "wakes":
                        activeGuard.wakeUp(Int32.Parse(data[1].Substring(3,2)));
                        break;
                }
            }
            int mostSlept = 0;
            Guard sleepyboi = null;
            foreach(var item in guards)
            {
                if(item.Value.mostSlept > mostSlept)
                {
                    mostSlept = item.Value.mostSlept;
                    sleepyboi = item.Value;
                }
            }
            Console.WriteLine(sleepyboi.id);
            Console.WriteLine(sleepyboi.mostSlept);
            Console.WriteLine(sleepyboi.mostSleptHour);
        }
    }
}
