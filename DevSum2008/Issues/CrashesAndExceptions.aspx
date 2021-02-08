<%@ Page Language="C#" masterpagefile="Issues.master" title="Crashes and Exceptions" %>

	<asp:Content ID="TitleContent" ContentPlaceHolderID="Title" runat="server">
		Crashes and Exceptions
	</asp:Content>
	<asp:Content ID="MainContent" ContentPlaceHolderID="MainTable" runat="server">
			<br/>
			<table style="width: 90%" style="text-align:left;font-size:x-large">
				<tr>
					<td><a href="Exceptions.aspx">Tracing Exceptions</a></td>
				</tr>
				<tr>
					<td>Unhandled Exceptions</td>
				</tr>
				<tr>
					<td><a href="../Code/OutOfMemoryExceptions.htm">OutOfMemoryExceptions</a></td>
				</tr>
				<tr>
					<td>StackOverflowExceptions</td>
				</tr>
				<tr>
					<td>FatalExecutionEngineExceptions</td>
				</tr>
				<tr>
					<td>Heap corruption</td>
				</tr>
				<tr>
					<td>Recycling</td>
				</tr>
			</table>
			<br/>
	</asp:Content>
