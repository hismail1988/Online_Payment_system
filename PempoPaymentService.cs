using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Online_Payment_System
{
    public class PempoPaymentService
    {
        private const string PempoApiUrl = "https://localhost:44372/api/PempoPayment/"; // Replace with the actual API URL
        //private const string ApiKey = "YOUR_API_KEY"; // Replace with your API key

        public async Task<bool> ProcessPayment(decimal amount, string cardNumber, string expirtionDate, string cvv)
        {

            using (HttpClient client = new HttpClient())
            {
                //client.DefaultRequestHeaders.Add("Authorization", $"Bearer {ApiKey}");

                var paymentData = new
                {
                    Amount = amount,
                    CardNumber = cardNumber,
                    ExpiryDate = expirtionDate,
                    CVV = cvv
                    // Add other required parameters as per Pempo's API
                };

                //var paymentRequest = new HttpRequestMessage(HttpMethod.Post, $"{PempoApiUrl}");
                //paymentRequest.Content = new StringContent(paymentData.ToString(), System.Text.Encoding.UTF8, "application/json");

                //var response =  client.PostAsync(paymentRequest).Result;

                client.BaseAddress = new Uri(PempoApiUrl);

                var json = JsonConvert.SerializeObject(paymentData);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = client.PostAsync("posts", content).Result;

                if (response.IsSuccessStatusCode)
                {
                    // Payment successful
                    return true;

                }
                else
                {
                    // Payment failed
                    return false;
                }
            }

        }

     
    }
}