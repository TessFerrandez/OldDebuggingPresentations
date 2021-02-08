<%@ Page Language="C#" masterpagefile="IssueDetails4.master" title="Locks and Critical Sections" %>

<script runat="server">

    protected void btnRun_Click(object sender, EventArgs e)
    {
        DateTime start = System.DateTime.Now;
        BusinessLayer bl = new BusinessLayer();
        bl.PerformSomeBusinessOperation();
        DateTime end = System.DateTime.Now;
        lblStart.Text = start.ToLongTimeString();
        lblStop.Text = end.ToLongTimeString();
        TimeSpan ts = end.Subtract(start);
        lblExecutionTime.Text = ts.Seconds.ToString() + " seconds";
    }
</script>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width:90%;text-align:left;font-size:x-large">
				<tr>
					<td>Start:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblStart" Text="00:00:00">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Stop:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblStop" Text="00:00:00">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Execution Time:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblExecutionTime" Text="0 seconds">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
					<asp:Button runat="server" Text="Run" id="btnRun" Width="85px" OnClick="btnRun_Click" /></td>
				</tr>
			</table>
			<br/>
	</asp:Content>
	<asp:Content ContentPlaceHolderID="CodeLink" id="codelinkicon" runat="server">
		<a href="../Code/Perf-Code.htm" target="_top"><img src="../Images/Code-256x256.png" width="40px" height="40px"/></a>
	</asp:Content>