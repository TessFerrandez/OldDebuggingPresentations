<%@ Page Language="C#" masterpagefile="IssueDetails3.master" title="Unexpected Roots" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">

    public String[] localstrings;
    
    protected void btnGC_Click(object sender, EventArgs e)
    {
        GC.Collect();
        GC.WaitForPendingFinalizers();
        GC.Collect();
        DisplayMemoryData();
    }

    public void DisplayMemoryData()
    {
        lblGen0.Text = GC.CollectionCount(0).ToString();
        lblGen1.Text = GC.CollectionCount(1).ToString();
        lblGen2.Text = GC.CollectionCount(2).ToString();
        lblNetMem.Text = GC.GetTotalMemory(false) / 1024 / 1024 + "";
        PerformanceCounter pc = new PerformanceCounter();
        pc.CategoryName = "Process";
        pc.CounterName = "Private Bytes";
        pc.InstanceName = "w3wp";
        int pBytes = (int)pc.NextValue() / 1024 / 1024;
        lblPrivateBytes.Text = pBytes.ToString();
        pc = new PerformanceCounter();
        pc.CategoryName = "Process";
        pc.CounterName = "Virtual Bytes";
        pc.InstanceName = "w3wp";
        int vBytes = (int)pc.NextValue() / 1024 / 1024;
        lblVirtualBytes.Text = vBytes.ToString();

    }

    public void OnRemove(string key, Object value, System.Web.Caching.CacheItemRemovedReason reason)
    {
        //do some stuff when the object is removed from cache
    }
    
    protected void btnRun_Click(object sender, EventArgs e)
    {
        //populate a large local variable - this should be removed from memory when the page is 
        localstrings = new String[100000];
        for (int i = 0; i < 100000; i++)
        {
            localstrings[i] = "Hello" + i.ToString();
        }

        //cache a small string for 5 minutes
        Cache.Add(Guid.NewGuid().ToString(), "smallstring", null, DateTime.Now.AddMinutes(5), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, this.OnRemove);

        DisplayMemoryData();
    }
</script>

<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		Unexpected Roots 
	</asp:Content>
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
					<td colspan="2">
						<hr width="90%"/>
					</td>
				</tr>
				<tr>
					<td>.NET Memory:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblNetMem" Text="0"></asp:Literal>&nbsp;MB
					</td>
				</tr>
				<tr>
					<td>Private Bytes:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblPrivateBytes" Text="0"></asp:Literal>&nbsp;MB
					</td>
				</tr>
				<tr>
					<td>VirtualBytes:</td>
					<td style="text-align:right">
						<asp:Literal runat="server" id="lblVirtualBytes" Text="0"></asp:Literal>&nbsp;MB
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<asp:Button runat="server" Text="Collect" id="btnGC" Width="85px" OnClick="btnGC_Click" />
						&nbsp;
						<asp:Button runat="server" Text="Run" id="btnRun" Width="85px" OnClick="btnRun_Click" />
					</td>
				</tr>
			</table>
			<br/>
	</asp:Content>
	<asp:Content ContentPlaceHolderID="CodeLink" id="codelinkicon" runat="server">
		<a href="../Code/Memory-Code.htm"><img src="../Images/Code-256x256.png" width="40px" height="40px"/></a>
	</asp:Content>