<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to populate a cascading ASPxComboBox on the client side</title>
	<script language="javascript" type="text/javascript">
		function OnSelectedIndexChanged(s, e) {
			pCombo.ClearItems();
			var strProduct = hField.Get(s.GetValue());
			if (!strProduct)
				return;
			var products = strProduct.split("#")
			for (var i = 0; i < products.length; ++i) {                
				var values = products[i].split(';');
				pCombo.AddItem(values[1], parseInt(values[0]));
			}
		}    
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxHiddenField ID="hField" runat="server" ClientInstanceName="hField">
		</dx:ASPxHiddenField>
		Select an item:
		<dx:ASPxComboBox ID="cbCategory" runat="server" ClientIDMode="AutoID" 
			DataSourceID="dsCategory" TextField="CategoryName" ValueField="CategoryID" 
			ValueType="System.Int32">
			<ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
		</dx:ASPxComboBox>
		<br/>
		Check the item list:
		<dx:ASPxComboBox ID="cbProduct" runat="server" ClientIDMode="AutoID" ClientInstanceName="pCombo"            
			ValueType="System.Int32">            
		</dx:ASPxComboBox>
	</div>
	<asp:SqlDataSource ID="dsProducts" runat="server" 
		ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
		SelectCommand="SELECT [ProductID], [ProductName], [CategoryID] FROM [Products]"></asp:SqlDataSource>
		<asp:SqlDataSource ID="dsCategory" runat="server" 
		ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
		SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
	</form>
</body>
</html>