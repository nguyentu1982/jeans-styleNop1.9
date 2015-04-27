//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Profile;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using NopSolutions.NopCommerce.BusinessLogic.Media;
 
namespace NopSolutions.NopCommerce.Web.Administration.Modules
{
    public partial class ServiceInfoControl : BaseNopAdministrationUserControl
    {
        private void FillDropDowns()
        {
            this.ddlLanguage.Items.Clear();
            var languages = this.LanguageService.GetAllLanguages();
            foreach (Language language in languages)
            {
                ListItem item2 = new ListItem(language.Name, language.LanguageId.ToString());
                this.ddlLanguage.Items.Add(item2);
            }
        }

        private void BindData()
        {
            Service service = this.ServiceService.GetServiceById(this.ServiceId);
            if (service != null)
            {
                CommonHelper.SelectListItem(this.ddlLanguage, service.LanguageId);
                this.txtTitle.Text = service.Title;
                this.txtShort.Text = service.Short;
                this.txtFull.Value = service.Full;
                this.cbPublished.Checked = service.Published;
                this.cbAllowComments.Checked = service.AllowComments;

                this.pnlCreatedOn.Visible = true;
                this.lblCreatedOn.Text = DateTimeHelper.ConvertToUserTime(service.CreatedOn, DateTimeKind.Utc).ToString();
                Picture servicePicture = service.Picture;
                string pictureUrl = this.PictureService.GetPictureUrl(servicePicture, 100);
                this.iServicePicture.ImageUrl = pictureUrl;
                var newsComments = service.ServiceComments;
                if (newsComments.Count > 0)
                {
                    this.hlViewComments.Visible = true;
                    this.hlViewComments.Text = string.Format(GetLocaleResourceString("Admin.ServiceInfo.ViewComments"), newsComments.Count);
                    this.hlViewComments.NavigateUrl = CommonHelper.GetStoreAdminLocation() + "ServiceComments.aspx?ServiceID=" + service.ServiceId;
                }
                else
                    this.hlViewComments.Visible = false;
            }
            else
            {
                this.pnlCreatedOn.Visible = false;
                this.hlViewComments.Visible = false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.FillDropDowns();
                this.BindData();
            }
        }

        public Service SaveInfo()
        {
            Service service = this.ServiceService.GetServiceById(ServiceId);
                        
            if (service != null)
            {
                #region Update
                Picture servicePicture = service.Picture;
                HttpPostedFile servicePictureFile = fuServicePicture.PostedFile;
                if ((servicePictureFile != null) && (!String.IsNullOrEmpty(servicePictureFile.FileName)))
                {
                    byte[] servicePictureBinary = servicePictureFile.GetPictureBits();
                    if (servicePicture != null)
                        servicePicture = this.PictureService.UpdatePicture(servicePicture.PictureId, servicePictureBinary, servicePictureFile.ContentType, true);
                    else
                        servicePicture = this.PictureService.InsertPicture(servicePictureBinary, servicePictureFile.ContentType, true);
                }
                int servicePictureId = 0;
                if (servicePicture != null)
                    servicePictureId = servicePicture.PictureId;


                service.LanguageId = int.Parse(this.ddlLanguage.SelectedItem.Value);
                service.Title = txtTitle.Text;
                service.Short = txtShort.Text;
                service.Full = txtFull.Value;
                service.Published = cbPublished.Checked;
                service.AllowComments = cbAllowComments.Checked;
                service.CreatedOn = DateTime.UtcNow;
                service.PictureId = servicePictureId;
 
                this.ServiceService.UpdateService(service);
                #endregion Update
            }
            else
            {
                #region Insert
                Picture servicePicture = null;
                HttpPostedFile servicePictureFile = fuServicePicture.PostedFile;
                if ((servicePictureFile != null) && (!String.IsNullOrEmpty(servicePictureFile.FileName)))
                {
                    byte[] servicePictureBinary = servicePictureFile.GetPictureBits();
                    if (servicePicture != null)
                        servicePicture = this.PictureService.UpdatePicture(servicePicture.PictureId, servicePictureBinary, servicePictureFile.ContentType, true);
                    else
                        servicePicture = this.PictureService.InsertPicture(servicePictureBinary, servicePictureFile.ContentType, true);
                }
                int servicePictureId = 0;
                if (servicePicture != null)
                    servicePictureId = servicePicture.PictureId;

                service = new Service()
                {
                    LanguageId = int.Parse(this.ddlLanguage.SelectedItem.Value),
                    Title = txtTitle.Text,
                    Short = txtShort.Text,
                    Full = txtFull.Value,
                    Published = cbPublished.Checked,
                    AllowComments = cbAllowComments.Checked,
                    CreatedOn = DateTime.UtcNow,
                    PictureId = servicePictureId
                };
                this.ServiceService.InsertService(service);
                #endregion Insert
            }
            return service;
        }

        #region Extension

        protected void btnRemoveServiceImage_Click(object sender, EventArgs e)
        {
            try
            {
                Service service = this.ServiceService.GetServiceById(this.ServiceId);
                if (service != null)
                {
                    this.PictureService.DeletePicture(service.PictureId);

                    service.PictureId = 0;
                    this.ServiceService.UpdateService(service);
                    BindData();
                }
            }
            catch (Exception exc)
            {
                ProcessException(exc);
            }
        }

        #endregion Extension

        public int ServiceId
        {
            get
            {
                return CommonHelper.QueryStringInt("ServiceId");
            }
        }
    }
}