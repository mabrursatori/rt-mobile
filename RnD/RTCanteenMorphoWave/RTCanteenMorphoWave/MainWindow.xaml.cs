using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RTCanteenMorphoWave
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            List<User> users = new List<User>();
            users.Add(new User() { pin = "12345678910", nip = "12345678910", nama = "Mabrur", jam = "10:00:00", tanggal = "04-12-2020", keterangan = "Baru Makan 1 Kali", ip = "192.168.1.2"});
            users.Add(new User() { pin = "1234", nip = "1234", nama = "Satori", jam = "10:00:00", tanggal = "04-12-2020", keterangan = "Baru Makan 1 Kali", ip = "192.168.1.2" });

            generateColumnGrid();
            dgLog.Items.Add(new User() { pin = "1234", nip = "1234", nama = "Mabrur", jam = "10:00:00", tanggal = "04-12-2020", keterangan = "Baru Makan 1 Kali", ip = "192.168.1.2" });
            
        }

        void generateColumnGrid()
        {
            dgLog.Columns.Add(new DataGridTextColumn { Header = "NIP", Binding = new Binding("nip"), Width = 180, DisplayIndex = 0 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "PIN", Binding = new Binding("pin"), Width = 180, DisplayIndex = 1 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "Nama", Binding = new Binding("nama"), Width = 250, DisplayIndex = 2 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "Jam", Binding = new Binding("jam"), Width = 100, DisplayIndex = 3 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "Tanggal", Binding = new Binding("tanggal"), Width = 100, DisplayIndex = 4 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "Keterangan", Binding = new Binding("keterangan"), Width = 250, DisplayIndex = 5 });
            dgLog.Columns.Add(new DataGridTextColumn { DisplayIndex = 6 });
            dgLog.Columns.Add(new DataGridTextColumn { Header = "IP", Binding = new Binding("ip"), DisplayIndex = 7 });
          
        }
    }

    public class User
    {
        public string pin { get; set; }
        public string nip { get; set; }

        public string nama { get; set; }

        public string jam { get; set; }

        public string tanggal { get; set; }

        public string keterangan { get; set; }

        public string ip { get; set; }


    }
}
