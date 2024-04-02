using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TradeCompanyV2
{
    public partial class ShowInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
            PanelNewOrder.Visible = true;
        }

        protected void ButtonSaveOrder_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Insert();
            GridView2.DataBind();
            ClearNewOrder();
            HideNewOrderPanel();
        }

        
        protected void ButtonCamcelOrder_Click(object sender, EventArgs e)
        {
            ClearNewOrder();
            HideNewOrderPanel();
        }

        /// <summary>
        /// Скрыть панель нового заказа
        /// </summary>
        private void HideNewOrderPanel()
        {
            PanelNewOrder.Visible = false;
        }

        /// <summary>
        /// Очистить панель новго заказа
        /// </summary>
        private void ClearNewOrder()
        {
            ProductName.Text = string.Empty;
            ProductPrice.Text = string.Empty;
            ProductCount.Text = string.Empty;
        }
    }
}