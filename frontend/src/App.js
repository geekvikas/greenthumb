import { BrowserRouter, Routes, Route } from "react-router-dom";
import SalesOverview from "./pages/SalesOverview";
import CustomerInsights from "./pages/CustomerInsights";
import { AppBar, Container, Toolbar, Typography, Box, Link} from '@mui/material';
import logo from "./images/logo.png"

export default function App() {
  const navItems = ["Sales", "Customers"]
  return (
    <BrowserRouter>
       <AppBar position="static" color="transparent" component="nav">
        <Toolbar>
          <img src={logo} alt={"GreenThumb Logo"} height={50} />
          <Typography variant="h6" sx={{ ml: 2}}>GreenThumb Analytics</Typography>
          <Box sx={{ ml:"auto", display: { xs: 'block', sm: 'block' } }}>
            {navItems.map((item) => (
              <Link key={item} sx={{ color: '#000', ml:2, textDecoration: "none" }} href={item.toLowerCase()}>
                {item}
              </Link>
            ))}
          </Box>
        </Toolbar>
       </AppBar>
       <Container sx={{mt: 4}} maxWidth="xl">
        <Routes>
          <Route path="/sales" element={<SalesOverview />} />
          <Route path="/customers" element={<CustomerInsights />} />
        </Routes>
       </Container>
    </BrowserRouter>
  )
}