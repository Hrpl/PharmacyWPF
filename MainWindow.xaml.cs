using Pharmacy.Models;
using Pharmacy.ViewModels;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MessageBox = System.Windows.Forms.MessageBox;

namespace Pharmacy
{

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Employee User = new Employee();
        public Medicine AddMedicine = new Medicine();
        public List<MedicInRequest> MedicineInRequest = new();

        
        public MainWindow(Employee _user)
        {

            InitializeComponent();
            using (PharmacyDbContext db = new PharmacyDbContext())
            {
                sortUserComboBox.ItemsSource = new List<string>() { "По возрастанию цены", "По убыванию цены" };

                List<string> filtertList = db.Medicines.Select(u => u.Manufacture).Distinct().ToList();
                filtertList.Insert(0, "Все производители");
                filterUserComboBox.ItemsSource = filtertList;
                countProducts.Text = $"Количество: {db.Medicines.Count()}";
            }

            this.DataContext = new ListMedicine();
            _user = User;
        }

        private void ViewListMedicine(object sender, RoutedEventArgs e) //Главный врач
        {
            medicineListView.Visibility = Visibility.Visible;
            FilterPanel.Visibility = Visibility.Visible;
            stackPanelMedicine.Visibility = Visibility.Collapsed;
            stackPanelRequest.Visibility = Visibility.Collapsed;
            ViewIssueList.Visibility = Visibility.Collapsed;

            using (PharmacyDbContext db = new PharmacyDbContext())
            {
                medicineListView.ItemsSource = db.Medicines.ToList();
            }
        }

        private void RouteToAddMedicine(object sender, RoutedEventArgs e)//Главный врач
        {
            medicineListView.Visibility = Visibility.Collapsed;
            stackPanelRequest.Visibility = Visibility.Collapsed;
            stackPanelMedicine.Visibility = Visibility.Visible;
            ViewIssueList.Visibility = Visibility.Collapsed;
            FilterPanel.Visibility = Visibility.Collapsed;
        }
        private void RouteToAddRequest(object sender, RoutedEventArgs e)//Главный врач
        {
            medicineListView.Visibility = Visibility.Collapsed;
            stackPanelMedicine.Visibility = Visibility.Collapsed;
            FilterPanel.Visibility = Visibility.Collapsed;
            stackPanelRequest.Visibility = Visibility.Visible;
            ViewIssueList.Visibility = Visibility.Visible;
        }
        private void ExitWindow(object sender, RoutedEventArgs e)
        {
            new Login().Show();
            this.Close();
        }

        private void NewMedicine(object sender, RoutedEventArgs e)
        {

            using (PharmacyDbContext db = new PharmacyDbContext())
            {
                AddMedicine.Name = NameMedicine.Text;
                AddMedicine.Manufacture = ManufactureMedicine.Text;
                db.Medicines.Add(AddMedicine);
                try
                {
                    db.SaveChanges();
                }
                catch
                {

                }
            }
        }

        private void AddMedicineInRequest(object sender, RoutedEventArgs e)
        {
            
            using (PharmacyDbContext db = new PharmacyDbContext())
            {
                bool isCurrent = true;

                try
                {
                    var med = db.Medicines.Where(m => m.Name == MedicineComboBox.SelectedItem).First();

                    foreach (var item in MedicineInRequest)
                    {
                        if (item.MedicineId == med.Id) isCurrent = false;
                    }

                    if (Quantity.Text == "") isCurrent = false;
                    if (Price.Text == "") isCurrent = false;

                    if (isCurrent)
                    {
                        MedicInRequest req = new MedicInRequest();
                        try
                        {
                            req.MedicineId = med.Id;
                            req.Quantity = Convert.ToInt32(Quantity.Text);
                            req.InUnitPrice = Convert.ToInt32(Price.Text);
                            req.AllPrice = req.Quantity * req.InUnitPrice;
                            MedicineInRequest.Add(req);
                        }
                        catch
                        {
                            MessageBox.Show("Лекарство не было добавлено", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }

                    }
                    else
                    {
                        MessageBox.Show("Лекарство не было добавлено", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                catch { MessageBox.Show("Лекарство не было добавлено", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            }
            Quantity.Text = "";
            Price.Text = "";
            issueList.ItemsSource = MedicineInRequest;
        }

        private void CreateRequest(object sender, RoutedEventArgs e)
        {
            using (PharmacyDbContext db = new PharmacyDbContext())
            {
                if (MedicineInRequest != null)
                {
                    var req = new Request();
                    if (NumberRequest.Text != "" && Provider.Text != "")
                    {
                        req.DateTime = DateTime.Now;
                        req.ProviderName = Provider.Text;
                        req.Status = "Create";
                        req.Number = NumberRequest.Text;
                        foreach (var item in MedicineInRequest)
                        {
                            item.RequestNumber = NumberRequest.Text;
                            req.SummaryPrice += item.AllPrice;
                        }

                        db.Request.Add(req);
                        db.MedicInRequest.AddRange(MedicineInRequest);

                        try
                        {
                            db.SaveChanges();
                            MessageBox.Show("Заявка создана", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        catch (Exception ex) { MessageBox.Show("Заявка не создана", "Сообщение", MessageBoxButtons.OK, MessageBoxIcon.Error); }
                    }
                    
                }
                Provider.Text = "";
                NumberRequest.Text = "";
            }
        }

        private void sortUserComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void filterUserComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void Update()
        {
            using (PharmacyDbContext db = new PharmacyDbContext())
            {

                var current = db.Medicines.ToList();
                medicineListView.ItemsSource = current;

                if (sortUserComboBox.SelectedIndex != -1)
                {
                    if (sortUserComboBox.SelectedValue == "По убыванию цены")
                    {
                        current = db.Medicines.OrderByDescending(u => u.SalePrice).ToList();
                    }

                    if (sortUserComboBox.SelectedValue == "По возрастанию цены")
                    {
                        current = db.Medicines.OrderBy(u => u.SalePrice).ToList();
                    }
                }

                if(filterUserComboBox.SelectedIndex != -1)
                {
                    if (db.Medicines.Select(u => u.Manufacture).Distinct().ToList().Contains(filterUserComboBox.SelectedValue))
                    {
                        current = current.Where(u => u.Manufacture == filterUserComboBox.SelectedValue.ToString()).ToList();
                    }
                    else
                    {
                        current = current.ToList();
                    }
                }

                if (searchBox.Text.Length > 0)
                {

                    current = current.Where(u => u.Name.Contains(searchBox.Text) || u.Manufacture.Contains(searchBox.Text)).ToList();

                }

                medicineListView.ItemsSource = current;
                countProducts.Text = $"Количество: {current.Count} из {db.Medicines.ToList().Count}";
            }
        }

    }
}