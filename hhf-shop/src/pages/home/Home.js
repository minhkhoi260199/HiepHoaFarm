import Item from "./item/Item";
import {
    Box,
    Grid,
    GridItem,
} from "@chakra-ui/react";
import SearchBar from "../../components/SearchBar";
import Cart from "./cart/Cart";
import CartMobileBar from "./cart/CartMobileBar";

const products = [
    {
        "idProduct" : "1",
        "productName" : "Bơ sáp",
        "description" : "Siêu ngon bổ rẻ",
        "productPrice" : "100.000",
        "saleUnit" : "KG",
        "gallery" : "bo4.jpg"
    },{
        "idProduct" : "2",
        "productName" : "Bơ bình dân",
        "description" : "Siêu ngon bổ rẻ, giác ả phải chăng siêu chất lượng được tuyển chọn từ miệt vườn",
        "productPrice" : "50.000",
        "saleUnit" : "KG",
        "gallery" : "bo2.jpg"
    },{
        "idProduct" : "3",
        "productName" : "Bơ 1",
        "description" : "Bơ loại một không rẻ nhưng siêu ngon siêu chất lượng không bơ nào sánh bằng. Đảm bảo đáng đồng tiền bát gạo luôn !!",
        "productPrice" : "1.000.000",
        "saleUnit" : "KG",
        "gallery" : "bo.jpg"
    }
]

function Home(){
    return(
            <Grid templateColumns='repeat(3, 1fr)' gap={4}>
                <GridItem colSpan={{ base: '3', md:'2'}}>
                    <Box display={{ base: 'block', md:'none'}}
                         bg='#f9f9f7' top={0} position='sticky'
                         zIndex={10}
                    >
                        <SearchBar/>
                    </Box>
                    {products.map(item=>{
                        return(
                            <Item key={item.idProduct} product={item}/>
                        )
                    })}
                </GridItem>
                <GridItem colSpan={1}
                          display={{ base: 'none', md:'block'}}
                >
                    <Box position="sticky" top={4}>
                        <SearchBar/>
                        <Cart/>
                    </Box>
                </GridItem>
                <CartMobileBar />
            </Grid>
    )
}
export default Home;