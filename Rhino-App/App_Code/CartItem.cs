using System;

public class CartItem : IEquatable<CartItem>
{
    
    public int Id_Prod { get; set; }
    public int Quantity { get; set; }

    public CartItem(int productId)
    {
        this.Id_Prod = productId;
    }

    public bool Equals(CartItem item)
    {
        return item.Id_Prod == this.Id_Prod;
    }
}