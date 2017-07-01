namespace ShopAround.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class nn_product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public nn_product()
        {
            nn_order_detail = new HashSet<nn_order_detail>();
        }

        public int id { get; set; }

        public int? category_id { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        public decimal price { get; set; }

        [Required]
        [StringLength(250)]
        public string description { get; set; }

        [Required]
        [StringLength(500)]
        public string big_img_url { get; set; }

        [StringLength(500)]
        public string small_img_url { get; set; }

        public int? quantity { get; set; }

        public int? qty_view { get; set; }

        public DateTime? create_at { get; set; }

        public int? active { get; set; }

        public virtual nn_category nn_category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<nn_order_detail> nn_order_detail { get; set; }
    }
}
