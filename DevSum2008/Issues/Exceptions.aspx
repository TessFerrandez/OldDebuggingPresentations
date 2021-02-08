<%@ Page Language="C#" masterpagefile="IssueDetails2.master" title="Tracing Exceptions" %>

<script runat="server">

    protected void btnRun_Click(object sender, EventArgs e)
    {
        BusinessLayer bl = new BusinessLayer();
        try
        {
            bl.RandomExFunction();
        }
        catch (Exception ex)
        {
            lblException.Text = ex.GetType().ToString();
            lblMessage.Text = ex.Message;
        }
    }
</script>

<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		Tracing Exceptions 
	</asp:Content>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width:90%;text-align:left;font-size:x-large">
				<tr>
					<td>Exception:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblException" Text="">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td>Message:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblMessage" Text="">
						</asp:Literal>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
					<asp:Button runat="server" Text="Throw" id="btnRun" Width="85px" OnClick="btnRun_Click" /></td>
				</tr>
			</table>
			<br/>
	</asp:Content>
	<asp:Content ContentPlaceHolderID="CodeLink" id="codelinkicon" runat="server">
		<a href="../Code/TrackCLR.htm"><img src="../Images/Code-256x256.png" width="40px" height="40px"/></a>
	</asp:Content>