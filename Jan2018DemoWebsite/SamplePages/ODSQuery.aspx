<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODSQuery.aspx.cs" Inherits="Jan2018DemoWebsite.SamplePages.ODSQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>ODS Query</h3>
    <div class="row">
        <asp:GridView ID="AlnumList" runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="AlbumListODS" 
            AllowPaging="True"
            pageSize="15"
            BorderStyle="None"
            GridLines="Horizontal"
            CellPadding="5"
            CellSpacing="10"
            width="1100px" OnSelectedIndexChanged="AlnumList_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Id" SortExpression="AlbumId">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Eval("AlbumId") %>' ID="TextBox1" width="40px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("AlbumId") %>' ID="Label1" width="40px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Eval("Title") %>' ID="TextBox2"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Title") %>' ID="Label2"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Artist" SortExpression="ArtistId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="AritstList1" runat="server" DataSourceID="ArtistListODS" DataTextField="Name" DataValueField="ArtistId" SelectedValue='<%# Eval("ArtistId") %>' width="300px" ></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="AritstList1" runat="server" DataSourceID="ArtistListODS" DataTextField="Name" DataValueField="ArtistId" SelectedValue='<%# Eval("ArtistId") %>' width="300px" ></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Year" SortExpression="ReleaseYear">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Eval("ReleaseYear") %>' ID="TextBox4" width="50px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ReleaseYear") %>' ID="Label4" width="50px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Label" SortExpression="ReleaseLabel">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Eval("ReleaseLabel") %>' ID="TextBox5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ReleaseLabel") %>' ID="Label5"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField SelectText="View" ShowSelectButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="AlbumListODS" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="Albums_List" 
            TypeName="ChinookSystem.BLL.AlbumController">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ArtistListODS" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="Artists_List" 
            TypeName="ChinookSystem.BLL.ArtistController">
        </asp:ObjectDataSource>
    </div>
</asp:Content>
