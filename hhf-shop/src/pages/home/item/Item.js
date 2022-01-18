import {Box, Flex, Grid, GridItem, Image, Square, Text} from "@chakra-ui/react";
import {useState} from "react";

function Item(props){
    const product = props.product;
    const [quantity, setQuantity] = useState(1)

    return(
        <Box p={3} bg="#ffde46" color="#605439"
             borderRadius='14'
        >
            <Grid templateColumns='repeat(2, 1fr)'>
                <GridItem colSpan={1} >
                    <Flex>
                        <Square flex='1'>
                            <Image
                                borderRadius='14'
                                // margin='auto'
                                maxWidth='100%'
                                // objectFit='cover'
                                src={require('./'+product.gallery)}
                                alt={product.gallery}
                            />
                        </Square>
                    </Flex>
                    <Grid templateColumns='repeat(5, 1fr)'
                          h='35px' gap={2} marginTop={2} p={1} bg='white'
                          borderRadius='10'
                    >
                        <GridItem colSpan={1} border='1px solid pink'/>
                        <GridItem colSpan={1} border='1px solid pink'/>
                        <GridItem colSpan={1} border='1px solid pink'/>
                        <GridItem colSpan={1} border='1px solid pink'/>
                        <GridItem colSpan={1} border='1px solid pink'/>
                    </Grid>

                </GridItem>
                <GridItem colSpan={1} p={3} paddingTop={0} >
                    <Text paddingTop={0} fontSize='3xl' fontWeight='bold'>{product.productName}</Text>
                    <p>{product.description}</p>
                    <p>{product.productPrice}</p>
                    <p>{product.saleUnit}</p>
                </GridItem>
            </Grid>
        </Box>
    )
}
export default Item