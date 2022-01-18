import {useEffect, useState} from "react";
import Item from "./item/Item";
import {Box, Grid, GridItem} from "@chakra-ui/react";

const products = [
    {
        "idProduct" : "1",
        "productName" : "Bơ sáp",
        "description" : "Siêu ngon bổ rẻ",
        "productPrice" : "100.000",
        "saleUnit" : "KG",
        "gallery" : "bo.jpg"
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
        "gallery" : "bo4.jpg"
    }
]

function Home(){

    return(
        <Grid templateColumns='repeat(3, 1fr)'>
            <GridItem colSpan={2} p={3}>
                {products.map(item=>{
                    console.log(item.idProduct)
                    return(
                        <>
                        <Item key={item.idProduct} product={item}/>
                        <p>=========</p>
                        </>
                    )
                })}
            </GridItem>
            <GridItem colSpan={1} bg='tomato' m={2}
                      borderRadius='14'
            >
                <h1>CART</h1>
            </GridItem>
        </Grid>
    )
}
export default Home;