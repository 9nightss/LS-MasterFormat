Add-Type -TypeDefinition @"
using System;
using System.Windows.Forms;

public class MyForm : Form
{
    public ComboBox cmbOS;
    public ComboBox cmbFS;
    public ComboBox cmbEncryption;
    public TextBox txtDeviceID;
    public TextBox txtLabel;
    public Button btnFormat;
    public Button btnExit;

    public MyForm()
    {
        this.Text = 'USB Tool';
        this.Size = new System.Drawing.Size(400, 300);

        // OS Selection ComboBox
        cmbOS = new ComboBox();
        cmbOS.Items.AddRange(new object[] { "Windows", "Linux", "macOS" });
        cmbOS.Location = new System.Drawing.Point(20, 20);
        this.Controls.Add(cmbOS);

        // File System Selection ComboBox
        cmbFS = new ComboBox();
        cmbFS.Items.AddRange(new object[] { "exFAT", "NTFS", "FAT32", "ext4" });
        cmbFS.Location = new System.Drawing.Point(20, 60);
        this.Controls.Add(cmbFS);

        // Encryption Type ComboBox
        cmbEncryption = new ComboBox();
        cmbEncryption.Items.AddRange(new object[] { "None", "BitLocker", "LUKS", "FileVault" });
        cmbEncryption.Location = new System.Drawing.Point(20, 100);
        this.Controls.Add(cmbEncryption);

        // Device ID TextBox
        txtDeviceID = new TextBox();
        txtDeviceID.Location = new System.Drawing.Point(20, 140);
        this.Controls.Add(txtDeviceID);

        // Drive Label TextBox
        txtLabel = new TextBox();
        txtLabel.Location = new System.Drawing.Point(20, 180);
        this.Controls.Add(txtLabel);

        // Format Button
        btnFormat = new Button();
        btnFormat.Text = 'Format & Encrypt';
        btnFormat.Location = new System.Drawing.Point(20, 220);
        btnFormat.Click += new EventHandler(this.BtnFormat_Click);
        this.Controls.Add(btnFormat);

        // Exit Button
        btnExit = new Button();
        btnExit.Text = 'Exit';
        btnExit.Location = new System.Drawing.Point(150, 220);
        btnExit.Click += new EventHandler(this.BtnExit_Click);
        this.Controls.Add(btnExit);
    }

    private void BtnFormat_Click(object sender, EventArgs e)
    {
        string selectedOS = cmbOS.SelectedItem.ToString();
        string selectedFS = cmbFS.SelectedItem.ToString();
        string selectedEncryption = cmbEncryption.SelectedItem.ToString();
        string deviceID = txtDeviceID.Text;
        string label = txtLabel.Text;

        if ([string]::IsNullOrEmpty(deviceID) -or [string]::IsNullOrEmpty(selectedOS) -or [string]::IsNullOrEmpty(selectedFS)) {
            MessageBox.Show('Please fill all fields.');
            return;
        }

        # Call your function with gathered inputs
        $Password = Read-Host "Enter encryption password" -AsSecureString
        Format-USBDrive -DeviceID $deviceID -FileSystem $selectedFS -Label $label -TargetOS $selectedOS
        Encrypt-Drive -DeviceID $deviceID -Password $Password -TargetOS $selectedOS -EncryptionType $selectedEncryption

        MessageBox.Show("Drive formatted and encrypted successfully.");
    }

    private void BtnExit_Click(object sender, EventArgs e)
    {
        this.Close();
    }
}

public class Program
{
    public static void Main()
    {
        Application.EnableVisualStyles();
        Application.Run(new MyForm());
    }
}
"@ 

# Run the form
[MyForm]::Main()
