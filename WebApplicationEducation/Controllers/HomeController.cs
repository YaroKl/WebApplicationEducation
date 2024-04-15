using System.Diagnostics;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WebApplicationEducation.Models;
using Dapper;


namespace WebApplicationEducation.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _config;

        public HomeController(ILogger<HomeController> logger, IConfiguration config)
        {
            _logger = logger;
            _config = config;
        }

        public IDbConnection Connection 
        { 
            get
            {
                return new SqlConnection(_config.GetConnectionString("DefaultConnection"));
            }
        }

        public IActionResult Index()
        {
            var items = GetAllUsers();
            return View(items);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        private List<User> GetAllUsers()
        {
            using (IDbConnection db = Connection)
            {
                List<User> result = db.Query<User>("SELECT * FROM Users").ToList();
                return result;
            }
        }

        public class User
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public double Balance { get; set; }
            public DateTime Created { get; set; }
        }
    }
}
