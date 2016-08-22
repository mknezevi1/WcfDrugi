<%@ Page Title="Vremenska prognoza" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WcfDrugi._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Vremenska prognoza</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Unesite željeni grad:
        <br />
        <asp:TextBox ID="tbUnos" runat="server"></asp:TextBox>
        <asp:Button ID="btnPrikazi" runat="server" Text="Prikaži" OnClick="btnPrikazi_Click" BackColor="#7AC0DA" />
    </h3>

    <asp:Label ID="lblError" runat="server" ForeColor="Red" />

    <table id="tblWeatherNow" runat="server" border="0" cellpadding="0" cellspacing="0"
        visible="false">
        <tr>
            <th colspan="2">Trenutno vrijeme
            </th>
        </tr>
        <tr>
            <td rowspan="3">
                <asp:Image ID="imgWeatherIcon" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLokacija" runat="server" />
                <asp:Image ID="imgZastava" runat="server" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <div style="float: left; width: 80px">
                    <asp:Image ID="imgOpis" runat="server" />
                </div>
                <div style="float: right; width: 100px">
                    <br />
                    <asp:Label ID="lblOpis" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    temperatura
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblTemperatura" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    vjetar
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblVjetar" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    tlak zraka
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblTlakZraka" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    vlažnost zraka
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblVlaznost" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    izlazak sunca
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblIzlazak" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="float: left; width: 100px">
                    zalazak sunca
                </div>
                <div style="float: right; width: 100px">
                    <asp:Label ID="lblZalazak" runat="server" />
                </div>
                <div style="clear: both"></div>
            </td>
        </tr>
    </table>

    <div id="sljedeciDani" runat="server" visible="false">
        <hr />
        <h3>Sljedeći dani</h3>
        <div style="display: inline-block;">
            <asp:Label ID="lblDan1Datum" runat="server" />
            <br />
            <asp:Image ID="imgDan1" runat="server" />
            <br />
            <asp:Label ID="lblDan1Opis" runat="server" />
            <br />
            <asp:Label ID="lblDan1TemperaturaMax" runat="server" />
            <br />
            <asp:Label ID="lblDan1TemperaturaMin" runat="server" />
        </div>
        <div style="display: inline-block;">
            <asp:Label ID="lblDan2Datum" runat="server" />
            <br />
            <asp:Image ID="imgDan2" runat="server" />
            <br />
            <asp:Label ID="lblDan2Opis" runat="server" />
            <br />
            <asp:Label ID="lblDan2TemperaturaMax" runat="server" />
            <br />
            <asp:Label ID="lblDan2TemperaturaMin" runat="server" />
        </div>
        <div style="display: inline-block;">
            <asp:Label ID="lblDan3Datum" runat="server" />
            <br />
            <asp:Image ID="imgDan3" runat="server" />
            <br />
            <asp:Label ID="lblDan3Opis" runat="server" />
            <br />
            <asp:Label ID="lblDan3TemperaturaMax" runat="server" />
            <br />
            <asp:Label ID="lblDan3TemperaturaMin" runat="server" />
        </div>
        <div style="display: inline-block;">
            <asp:Label ID="lblDan4Datum" runat="server" />
            <br />
            <asp:Image ID="imgDan4" runat="server" />
            <br />
            <asp:Label ID="lblDan4Opis" runat="server" />
            <br />
            <asp:Label ID="lblDan4TemperaturaMax" runat="server" />
            <br />
            <asp:Label ID="lblDan4TemperaturaMin" runat="server" />
        </div>
        <div style="display: inline-block;">
            <asp:Label ID="lblDan5Datum" runat="server" />
            <br />
            <asp:Image ID="imgDan5" runat="server" />
            <br />
            <asp:Label ID="lblDan5Opis" runat="server" />
            <br />
            <asp:Label ID="lblDan5TemperaturaMax" runat="server" />
            <br />
            <asp:Label ID="lblDan5TemperaturaMin" runat="server" />
        </div>
    </div>
</asp:Content>
