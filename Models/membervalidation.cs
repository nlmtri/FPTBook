using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace lib.Models
{
    [MetadataType(typeof(memberMetaData))]
    public partial class member
    {
        public class memberMetaData
        {
            [DisplayName("Members Name")]
            public string name { get; set; }
            [DisplayName("Address")]
            public string address { get; set; }
            [DisplayName("Phone ")]
            public string phone { get; set; }
        }
    }
}