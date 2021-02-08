<%@ Page Language="C#" masterpagefile="Issues.master" title="Performance Issues" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Runtime.Serialization" %>
<%@ Import Namespace="System.Runtime.Serialization.Formatters.Binary" %>

<script runat="server">

    protected void btnRun_Click(object sender, EventArgs e)
    {
        // Create a new DataTable.
        System.Data.DataTable table = new DataTable("ParentTable");
        // Declare variables for DataColumn and DataRow objects.
        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, 
        // ColumnName and add to DataTable.    
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.Int32");
        column.ColumnName = "ID";
        column.ReadOnly = true;
        column.Unique = true;
        // Add the Column to the DataColumnCollection.
        table.Columns.Add(column);

        // Create second column.
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "FirstName";
        column.AutoIncrement = false;
        column.Caption = "FirstName";
        column.ReadOnly = false;
        column.Unique = false;
        // Add the column to the table.
        table.Columns.Add(column);

        // Create second column.
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "LastName";
        column.AutoIncrement = false;
        column.Caption = "LastName";
        column.ReadOnly = false;
        column.Unique = false;
        // Add the column to the table.
        table.Columns.Add(column);

        // Create second column.
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "UserName";
        column.AutoIncrement = false;
        column.Caption = "UserName";
        column.ReadOnly = false;
        column.Unique = false;
        // Add the column to the table.
        table.Columns.Add(column);

        // Create second column.
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "IsUserAMemberOfTheAdministratorsGroup";
        column.AutoIncrement = false;
        column.Caption = "IsUserAMemberOfTheAdministratorsGroup";
        column.ReadOnly = false;
        column.Unique = false;
        // Add the column to the table.
        table.Columns.Add(column);

        // Instantiate the DataSet variable.
        DataSet dataSet = new DataSet();
        // Add the new DataTable to the DataSet.
        dataSet.Tables.Add(table);

        // Create three new DataRow objects and add 
        // them to the DataTable
        for (int i = 0; i <= 10000; i++)
        {
            row = table.NewRow();
            row["id"] = i;
            row["FirstName"] = "Bo";
            row["LastName"] = "Ek";
            row["UserName"] = "BoEk";
            row["IsUserAMemberOfTheAdministratorsGroup"] = "No";
            table.Rows.Add(row);
        }
        //string xml = dataSet.GetXml().ToString();

        // To serialize the hashtable and its key/value pairs,  
        // you must first open a stream for writing. 
        // In this case, use a file stream.
        FileStream fs = new FileStream("c:\\test\\DataFile.dat", FileMode.Create);

        // Construct a BinaryFormatter and use it to serialize the data to the stream.
        BinaryFormatter formatter = new BinaryFormatter();
        try
        {
            formatter.Serialize(fs, dataSet);
        }
        catch (SerializationException ex)
        {
            Response.Write("Failed to serialize. Reason: " + ex.Message);
            throw;
        }
        finally
        {
            fs.Close();
        }
    }

    protected void btnGC_Click(object sender, EventArgs e)
    {
        GC.Collect();
        GC.WaitForPendingFinalizers();
        GC.Collect();
    }
</script>

<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		Performance Issues and Hangs
	</asp:Content>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width: 90%;text-align:left;font-size:x-large">
				<tr>
					<td><a href="LocksAndCriticalSections.aspx">Locks and Critical Sections</a></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><a href="HighCPUInGC.aspx">High CPU in GC</a></td>
					<td><a href="HighCPUInGCRev.aspx">Revised</a></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><a href="../Code/DataSetSerialization.htm">Serialization</a></td>
					<td>
					<asp:Button runat="server" Text="Run" id="btnRun" Width="85px" OnClick="btnRun_Click" /></td>
					<td>
					<asp:Button runat="server" Text="Collect" id="btnGC" Width="85px" OnClick="btnGC_Click" /></td>
				</tr>
				<tr>
					<td><a href="../Code/ApplicationRestarts.htm">Compilation/Application Restarts</a></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Poorly Formatted Regular Expressions</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Infinite Loops</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Waiting for External Resources</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
	</asp:Content>
