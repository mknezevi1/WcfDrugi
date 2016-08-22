using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;
using System.Text;
using Newtonsoft.Json;

namespace WcfDrugi
{
    public partial class _Default : Page
    {
        private string appId = "77e9c765367b4e7a4e45de0de69c0253";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPrikazi_Click(object sender, EventArgs e)
        {
            if (tbUnos.Text != "")
            {
                try
                {
                    using (WebClient client = new WebClient())
                    {
                        //prikaz trenutnih vremenskih podataka
                        string urlTrenutno = string.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&units=metric&cnt=1&APPID={1}&lang=hr", tbUnos.Text.Trim(), appId);
                        string jsonTrenutno = client.DownloadString(urlTrenutno);
                        prikaziTrenutno(jsonTrenutno);
                        //prikaz podataka za narednih 5 dana (danas i narednih 5 dana)
                        string urlSljedeciDani = string.Format("http://api.openweathermap.org/data/2.5/forecast/daily?q={0}&mode=json&units=metric&cnt=6&appid={1}&lang=hr", tbUnos.Text.Trim(), appId);
                        string jsonSljedeciDani = client.DownloadString(urlSljedeciDani);
                        prikaziSljedeceDane(jsonSljedeciDani);

                        lblError.Text = "";
                    }
                }
                catch
                {
                    lblError.Text = "Usluga nije dostupna, molimo provjerite unesene podatke.";
                }
            }
            else
            {
                lblError.Text = "Molimo unesite grad.";
            }
        }

        private void prikaziTrenutno(string json)
        {
            //obrada dobivenog json-a (koristenje klase koje mapira podatke)
            byte[] bytes = Encoding.Default.GetBytes(json);
            json = Encoding.UTF8.GetString(bytes);
            WeatherInfo weatherData = (new JavaScriptSerializer()).Deserialize<WeatherInfo>(json);
            //postavljanje vrijednosti labela 
            lblLokacija.Text = weatherData.name + "," + weatherData.sys.country;
            imgZastava.ImageUrl = string.Format("http://openweathermap.org/images/flags/{0}.png", weatherData.sys.country.ToLower());
            lblOpis.Text = weatherData.weather[0].description;
            imgOpis.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", weatherData.weather[0].icon);
            lblTemperatura.Text = string.Format("{0}°С", Math.Round((double)weatherData.main.temp, 1));
            lblVjetar.Text = weatherData.wind.speed.ToString() + " m/s";
            lblTlakZraka.Text = weatherData.main.pressure + " hPa";
            lblVlaznost.Text = weatherData.main.humidity + " %";
            lblIzlazak.Text = UnixTimeStampToDateTime(weatherData.sys.sunrise).ToString("HH:mm") + " h";
            lblZalazak.Text = UnixTimeStampToDateTime(weatherData.sys.sunset).ToString("HH:mm") + " h";
            //otvaranje prikaza tablice za trenutne vremenske podatke
            tblWeatherNow.Visible = true;
        }

        private void prikaziSljedeceDane(string json)
        {
            //obrada dobivenog json-a (nema unutarnje klase koja mapira podatke, koristenje NuGet paketa za JsonConvert)
            byte[] bytes = Encoding.Default.GetBytes(json);
            json = Encoding.UTF8.GetString(bytes);
            dynamic jsonDes = JsonConvert.DeserializeObject(json);
            //postavljanje vrijednosti labela
            Label lblPom;
            Image imgPom;
            for (int i = 1; i <= 5; i++)
            {
                lblPom = FindControl(Page, "lblDan" + i + "Datum") as Label;
                lblPom.Text = UnixTimeStampToDateTime((int)jsonDes.list[i].dt.Value).ToString("dd. MM. yyyy.");
                lblPom = FindControl(Page, "lblDan" + i + "Opis") as Label;
                lblPom.Text = jsonDes.list[i].weather[0].description.Value;
                lblPom = FindControl(Page, "lblDan" + i + "TemperaturaMin") as Label;
                lblPom.Text = string.Format("{0}°С", Math.Round((double)jsonDes.list[i].temp.min.Value, 1));
                lblPom = FindControl(Page, "lblDan" + i + "TemperaturaMax") as Label;
                lblPom.Text = string.Format("{0}°С", Math.Round((double)jsonDes.list[i].temp.max.Value, 1));
                imgPom = FindControl(Page, "imgDan" + i) as Image;
                imgPom.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", jsonDes.list[i].weather[0].icon.Value);
            }
            //otvaranje prikaza podataka za sljedeće dane
            sljedeciDani.Visible = true;
        }

        public static DateTime UnixTimeStampToDateTime(double unixTimeStamp)
        {
            System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            dtDateTime = dtDateTime.AddSeconds(unixTimeStamp).ToLocalTime();
            return dtDateTime;
        }

        private Control FindControl(Control root, string id)
        {
            if (root.ID == id) return root;
            foreach (Control c in root.Controls)
            {
                Control t = FindControl(c, id);
                if (t != null) return t;
            }
            return null;
        }
    }
}