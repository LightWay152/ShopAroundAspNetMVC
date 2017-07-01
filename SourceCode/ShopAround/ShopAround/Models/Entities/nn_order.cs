namespace ShopAround.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class nn_order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public nn_order()
        {
            nn_order_detail = new HashSet<nn_order_detail>();
        }

        public int id { get; set; }

        public int? user_id { get; set; }

        public DateTime? create_at { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [StringLength(500)]
        public string address { get; set; }

        [StringLength(50)]
        public string mobile { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        public int? status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<nn_order_detail> nn_order_detail { get; set; }

        public virtual nn_user nn_user { get; set; }
    }
}
