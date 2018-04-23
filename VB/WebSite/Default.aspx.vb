Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private products As New Dictionary(Of Integer, String)()
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			GetProductsByCategory()
		End If
	End Sub

	Private Sub GetProductsByCategory()
		Dim p As DataView
		p = CType(dsProducts.Select(DataSourceSelectArguments.Empty), DataView)

		For Each r As DataRowView In p
			Dim categoryId As Integer = CInt(Fix(r("CategoryID")))
			If products.ContainsKey(categoryId) Then
				products(categoryId) = String.Format("{0}#{1};{2}", products(categoryId), r(0), r(1))
			Else
				products(categoryId) = String.Format("{0};{1}", r(0), r(1))
			End If
		Next r

		For Each id As Integer In products.Keys
			hField.Add(id.ToString(), products(id))
		Next id
	End Sub
End Class