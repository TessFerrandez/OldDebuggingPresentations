<%@ Page Language="C#" masterpagefile="IssueDetails2.master" title="High CPU in GC" %>

<script runat="server">

    public void DisplayMemoryData()
    {
        lblGen0.Text = GC.CollectionCount(0).ToString();
        lblGen1.Text = GC.CollectionCount(1).ToString();
        lblGen2.Text = GC.CollectionCount(2).ToString();
    }
    
    protected void btnMemData_Click(object sender, EventArgs e)
    {
        DisplayMemoryData();
    }

    protected void btnRun_Click(object sender, EventArgs e)
    {
        DateTime start = System.DateTime.Now;
        BusinessLayer bl = new BusinessLayer();
        bl.ConcatenateBigStringRev();
        DateTime end = System.DateTime.Now;
        TimeSpan ts = end.Subtract(start);
        lblExecutionTime.Text = ts.Seconds.ToString() + " seconds " + ts.Milliseconds.ToString() + " milliseconds";
        DisplayMemoryData();
    }
</script>

<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		High CPU in GC 
		(Revised)</asp:Content>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width:90%;text-align:left;font-size:x-large">
				<tr>
					<td>Gen 0 Collections:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblGen0" Text="0"></asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Gen 1 Collections:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblGen1" Text="0"></asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Gen 2 Collections:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblGen2" Text="0"></asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Execution Time:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblExecutionTime" Text="0 milliseconds">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<asp:Button runat="server" Text="Display GC" id="btnMemData" Width="85px" OnClick="btnMemData_Click" />
						&nbsp;
						<asp:Button runat="server" Text="Run" id="btnRun" Width="85px" OnClick="btnRun_Click" />
					</td>
				</tr>
			</table>
			<br/>
	</asp:Content>
	<asp:Content ContentPlaceHolderID="CodeLink" id="codelinkicon" runat="server">
		<a href="../Code/HighCPURev-Code.htm"><img src="../Images/Code-256x256.png" width="40px" height="40px"/></a>
	</asp:Content>