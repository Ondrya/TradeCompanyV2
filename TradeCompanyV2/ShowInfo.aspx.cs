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


        /// <summary>
        /// Добавить новый заказ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonOrderAdd_Click(object sender, EventArgs e)
        {
            PanelNewOrder.Visible = true;
        }

        /// <summary>
        /// Сохранить заказ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonSaveOrder_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Insert();
            GridView2.DataBind();
            ClearNewOrder();
            HideNewOrderPanel();
        }

        /// <summary>
        /// Отменить добавление заказа
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonCancelOrder_Click(object sender, EventArgs e)
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

        /// <summary>
        /// Редактировать заказы
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonOrderEdit_Click(object sender, EventArgs e)
        {
            if (GridView2.AutoGenerateEditButton == true)
            {
                GridView2.AutoGenerateEditButton = false;
                ButtonOrderEdit.Text = "Редактировать заказы";
            }
            else
            {
                GridView2.AutoGenerateEditButton = true;
                ButtonOrderEdit.Text = "Закончить редактирование";
            }
        }
    }
}