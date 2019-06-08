using System.Collections.Generic;
using System.Web;

public class Cart
{
    private List<CartItem> shopCart;

    public List<CartItem> GetShopCart()
    {
        return shopCart;
    }

    private void SetShopCart(List<CartItem> value)
    {
        shopCart = value;
    }

    public static Cart GetShoppingCart()
    {
        
        if (HttpContext.Current.Session["cart"] == null)
        {
            var cart = new Cart();
            cart.SetShopCart(new List<CartItem>());
            HttpContext.Current.Session["cart"] = cart;
        }

        return (Cart)HttpContext.Current.Session["cart"];
    }


    public void AddItem(int productId)
    {

        var newItem = new CartItem(productId);

        if (GetShopCart().Contains(newItem))
        {
            foreach (var item in GetShopCart())
            {
                if (item.Equals(newItem))
                {
                    item.Quantity++;
                    return;
                }
            }
        }
        else
        {       
            newItem.Quantity = 1;
            GetShopCart().Add(newItem);
        }
    }

    public void SetItemQuantity(int productId, int quantity)
    {
        if (quantity == 0)
        {
            RemoveItem(productId);
            return;
        }
        
        var updatedItem = new CartItem(productId);

        foreach (var item in GetShopCart())
        {
            if (item.Equals(updatedItem))
            {
                item.Quantity = quantity;
                return;
            }
        }
    }


    public void RemoveItem(int productId)
    {
        var removedItem = new CartItem(productId);
        GetShopCart().Remove(removedItem);
    }


}