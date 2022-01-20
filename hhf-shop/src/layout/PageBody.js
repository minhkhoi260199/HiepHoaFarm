import {Routes, Route} from "react-router-dom";
import {Grid, GridItem} from "@chakra-ui/react";
import Home from "../pages/home/Home";
import About from "../pages/aboutUs/About";
import Contact from "../pages/contact/Contact";
import ComingSoon from "../pages/info/ComingSoon";
import NotFound from "../pages/info/NotFound";

function PageBody(){
    return(
        <Grid templateColumns='repeat(10, 1fr)' margin='auto' maxW='1450px'>
            <GridItem display={{ base: 'none', md:'none', lg: 'block' }}
                      colSpan={{ base: '0', md:'0', lg: '1' }}
            >
                {/*Side banner 1*/}
            </GridItem>
            <GridItem colSpan={{ base: '10', md:'10', lg: '8' }}
                      bg="#f9f9f7" p={4}
            >
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/about" element={<About />} />
                    <Route path="/contact" element={<Contact />} />
                    <Route path="/comingSoon" element={<ComingSoon />} />
                    <Route path="/notFound" element={<NotFound />} />
                </Routes>
            </GridItem>
            <GridItem display={{ base: 'none', md:'none', lg: 'block' }}
                      colSpan={{ base: '0', md:'0', lg: '1' }}
            >
                {/*Side banner 2*/}
            </GridItem>
        </Grid>
    );
}

export default PageBody;