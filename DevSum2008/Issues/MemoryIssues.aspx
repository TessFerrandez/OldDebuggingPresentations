<%@ Page Language="C#" masterpagefile="Issues.master" title="Memory Issues" %>

<script runat="server">

    protected void btnRunSession_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        int rand = r.Next(4);
        switch (rand)
        {
            case 0:
                Session["UserName"] = "JohnSmith";
                break;
            case 1:
                Session["UserName"] = "SamJones";
                break;
            case 2:
                Session["UserName"] = "JaneDoe";
                break;
            default:
                Session["UserName"] = "BillG_99";
                break;
        }
        rand = r.Next(2);
        switch (rand)
        {
            case 0:
                Session["UserType"] = "User";
                break;
            default:
                Session["UserType"] = "Admin";
                break;
        }

        int amount = 100000;
        rand = r.Next(3);
        switch (rand)
        {
            case 0:
                amount = 1;
                break;
            case 1:
                amount = 1000000;
                break;
            default:
                break;
        }

        ArrayList al = new ArrayList();
        for (int i = 0; i < amount; i++)
        {
            al.Add("SomeProduct");
        }
        Session["ProductsOrdered"] = al;
    }

    protected void btnRunAssemblies_Click(object sender, EventArgs e)
    {
        BusinessLayer bl = new BusinessLayer();
        bl.SerializeStuff();
    }
</script>

<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		Memory Issues 
	</asp:Content>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width: 90%;text-align:left;font-size:x-large">
				<tr>
					<td>Cache and Session</td>
					<td><asp:Button runat="server" Text="Run" id="btnRunSession" Width="85px" OnClick="btnRunSession_Click" /></td>
				</tr>
				<tr>
					<td><a href="UnexpectedRoots.aspx">Unexpected roots</a></td>
					<td><a href="UnexpectedRootsRev.aspx">Revised</a></td>
				</tr>
				<tr>
					<td>High usage of the Large Object Heap (LOH)</td>
					<td>
					&nbsp;</td>
				</tr>
				<tr>
					<td>Blocked finalizers</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><a href="../Code/MidLifeChrisis.htm">Bad resource management / Finalizable objects / Mid-life 
					chrisis</a></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><a href="../Code/Assemblies.htm">Dynamic assemblies</a></td>
					<td>
					<asp:Button runat="server" Text="Run" id="btnRunAssemblies" Width="85px" OnClick="btnRunAssemblies_Click" /></td>
				</tr>
				<tr>
					<td>Other assembly related issues</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Native memory leaks</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<br/>
	</asp:Content>
