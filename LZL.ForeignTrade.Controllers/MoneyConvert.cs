using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Globalization;

namespace LZL.ForeignTrade.Controllers
{

    //大小写转换
    public enum CharCase
    {
        avsSentencecase,
        avslowercase,
        avsUPPERCASE,
        avsTitleCase
    }
    //将阿拉伯数字转换为英文货币
    public class MoneyConvert
    {
        //定义1-19的英文数字
        private string[] Num1_20 = new string[20];
        //定义20-90的英文数字
        private string[] Num20_90 = new string[10];
        string numberInWord = string.Empty;
        double number = 0;
        CharCase charCase = CharCase.avsUPPERCASE;
        string currency = "USD";
        bool showonly = false;


        //构造函数，为数组赋初值
        public MoneyConvert()
        {
            Num1_20[1] = "One";
            Num1_20[2] = "Two";
            Num1_20[3] = "Three";
            Num1_20[4] = "Four";
            Num1_20[5] = "Five";
            Num1_20[6] = "Six";
            Num1_20[7] = "Seven";
            Num1_20[8] = "Eight";
            Num1_20[9] = "Nine";
            Num1_20[10] = "Ten";
            Num1_20[11] = "Eleven";
            Num1_20[12] = "Twelve";
            Num1_20[13] = "Thirteen";
            Num1_20[14] = "Fourteen";
            Num1_20[15] = "Fifteen";
            Num1_20[16] = "Sixteen";
            Num1_20[17] = "Seventeen";
            Num1_20[18] = "Eighteen";
            Num1_20[19] = "Nineteen";
            Num20_90[2] = "Twenty";
            Num20_90[3] = "Thirty";
            Num20_90[4] = "Forty";
            Num20_90[5] = "Fifty";
            Num20_90[6] = "Sixty";
            Num20_90[7] = "Seventy";
            Num20_90[8] = "Eighty";
            Num20_90[9] = "Ninety";
        }

        //计算1-99之间的数并转换为英文
        private string F1_99(long inum)
        {
            string str = string.Empty;
            if (inum >= 1 && inum <= 19)
            {
                str = F1_19(inum);
            }
            if (inum >= 20 && inum <= 99)
            {
                if (inum % 10 == 0)
                {
                    str = F20_90(inum / 10);
                }
                else
                {
                    str = F20_90(inum / 10) + " " + F1_19(inum % 10);
                }
            }
            return str;
        }


        private string F1_999(long inum)
        {
            string str = string.Empty;
            if (inum == 0)
            {
                str = "";
            }
            if (inum >= 1 && inum <= 99)
            {
                str = F1_99(inum);
            }
            if (inum >= 100 && inum <= 999)
            {
                str = F100_999(inum);
            }
            return str;
        }

        private string F100_999(long inum)
        {
            if (inum % 100 != 0)
            {
                return F1_19(inum / 100) + " Hundred and " + F1_99(inum % 100);
            }
            else
            {
                return F1_19(inum / 100) + " Hundred";
            }
        }
        private string F1000_999999(long inum)
        {
            if (inum % 1000 != 0)
            {
                if ((inum % 1000) / 100 >= 1)
                {
                    if (inum > 1000)
                    {
                        return F1_999(inum / 1000) + " Thousand " + F1_999(inum % 1000);
                    }
                    else
                    {
                        return F1_999(inum / 1000) + F1_999(inum % 1000);
                    }
                }
                else
                {
                    if (inum > 1000)
                    {
                        return F1_999(inum / 1000) + " Thousand and " + F1_999(inum % 1000);
                    }
                    else
                    {
                        return F1_999(inum / 1000) + " and " + F1_999(inum % 1000);
                    }
                }
            }
            else
            {
                return F1_999(inum / 1000) + " Thousand";
            }

        }

        private string F1000000_999999999(long inum)
        {
            if (inum % 1000000 != 0)
            {
                return F1_999(inum / 1000000) + " Million " + F1000_999999(inum % 1000000);
            }
            else
            {
                return F1_999(inum / 1000000) + " Million";
            }
        }


        private string F20_90(long inum)
        {
            return Find_word_20_90(inum);
        }

        private string F1_19(long inum)
        {
            return Find_word_1_19(inum);
        }

        private string Find_word_1_19(long inum)
        {
            string Cword = string.Empty;
            Cword = Num1_20[inum];
            return Cword;

        }

        private string Find_word_20_90(long inum)
        {
            string Cword = string.Empty;
            Cword = Num20_90[inum];
            return Cword;
        }



        private void ChangeCase()
        {
            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            TextInfo textInfo = cultureInfo.TextInfo;
            switch (charCase)
            {
                case CharCase.avslowercase: numberInWord = numberInWord.ToLower();
                    break;
                case CharCase.avsUPPERCASE: numberInWord = numberInWord.ToUpper();
                    break;
                case CharCase.avsTitleCase: numberInWord = textInfo.ToTitleCase(numberInWord);
                    break;
            }
        }
        private void ChangeCurrency()
        {
            numberInWord = currency.Trim() + " " + numberInWord.Trim();
        }
        private void ChangeShowOnly()
        {
            //空白定义
        }
        private void ChangeNumber()
        {
            string orgstr = string.Empty;
            //两位小数
            orgstr = number.ToString("F2");
            int lint = orgstr.Length;
            int intvalue = int.Parse(orgstr.Substring(0, lint - 3));
            int decvalue = int.Parse(orgstr.Substring(lint - 2, 2));
            if (intvalue < 0 || intvalue > 999999999)
            {
                numberInWord = "Out of Range!";
            }
            else
            {
                numberInWord = NToE(intvalue);
                if (decvalue > 0)
                {
                    int i = numberInWord.IndexOf(" and".Trim());
                    // if (i > 0)
                    // {
                    //   numberInWord = numberInWord.Remove(i, 3);
                    numberInWord = numberInWord + " and cents " + NToE(decvalue);
                    if (showonly)
                    {
                        numberInWord = numberInWord + " only ";
                    }
                    //}
                }
                else
                {
                    if (showonly)
                    {
                        numberInWord = numberInWord + " only ";
                    }
                }

            }

        }



        private string NToE(long inum)
        {
            string Count_string = string.Empty;
            if (inum == 0)
            {
                Count_string = "Zero";
            }
            else
            {
                if (inum >= 1 && inum <= 999)
                {
                    Count_string = F1_999(inum);
                }
                else if (inum >= 1000 && inum <= 999999)
                {
                    Count_string = F1000_999999(inum);
                }
                else if (inum >= 1000000 && inum <= 999999999)
                {
                    Count_string = F1000000_999999999(inum);
                }
            }
            return Count_string;
        }



        private void Update()
        {

        }


        public string NumberInWorld
        {
            get
            {
                return numberInWord;
            }
            set
            {
                numberInWord = value;
            }
        }

        public double Number
        {

            get
            {
                return number;
            }
            set
            {
                number = value;
                ChangeNumber();
            }
        }

        public CharCase NumberCase
        {
            get { return charCase; }
            set
            {
                charCase = value;
                ChangeCase();
            }
        }

        public string Currency
        {
            get { return currency; }
            set
            {
                currency = value;
                ChangeCurrency();
            }
        }

        public bool ShowOnly
        {
            get { return showonly; }
            set
            {
                showonly = true;
                ChangeShowOnly();
            }
        }

        public static string ConverDigToEng(double number)
        {
            MoneyConvert mct = new MoneyConvert();
            mct.Number = number;
            mct.NumberCase = CharCase.avsUPPERCASE;
            mct.Currency = "USD";
            mct.ShowOnly = true;
            return mct.NumberInWorld;

        }
    }
}
