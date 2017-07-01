namespace ShopAround.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ShopAroundDbContext : DbContext
    {
        public ShopAroundDbContext()
            : base("name=ShopAroundDbContext")
        {
        }

        public virtual DbSet<nn_admin> nn_admin { get; set; }
        public virtual DbSet<nn_category> nn_category { get; set; }
        public virtual DbSet<nn_order> nn_order { get; set; }
        public virtual DbSet<nn_order_detail> nn_order_detail { get; set; }
        public virtual DbSet<nn_product> nn_product { get; set; }
        public virtual DbSet<nn_user> nn_user { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<nn_category>()
                .HasMany(e => e.nn_product)
                .WithOptional(e => e.nn_category)
                .HasForeignKey(e => e.category_id);

            modelBuilder.Entity<nn_order>()
                .HasMany(e => e.nn_order_detail)
                .WithRequired(e => e.nn_order)
                .HasForeignKey(e => e.order_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<nn_product>()
                .HasMany(e => e.nn_order_detail)
                .WithRequired(e => e.nn_product)
                .HasForeignKey(e => e.product_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<nn_user>()
                .HasMany(e => e.nn_order)
                .WithOptional(e => e.nn_user)
                .HasForeignKey(e => e.user_id);
        }
    }
}
